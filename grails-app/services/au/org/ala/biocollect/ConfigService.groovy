package au.org.ala.biocollect

import grails.core.GrailsApplication

/**
 *  Compute those computational configurations which their dependent fields may be overwritten by external
 */
class ConfigService {

    GrailsApplication grailsApplication
    /**
     * Reset possible configrations replaced by external config
     * @return
     */
    def computeConfig() {
        log.info('Computing config properties..........')
        log.info("Register to CAS: " + grailsApplication.config.getProperty("security.cas.appServerName"))

        def googleMapApiKey = grailsApplication.config.getProperty("google.maps.apiKey")
        if (googleMapApiKey){
            grailsApplication.config.google.maps.url =  grailsApplication.config["google.maps.base"] + googleMapApiKey
            log.info('Google Map URL:' + grailsApplication.config.google.maps.url)
        }else
            throw new Exception('You.Need.To.Add.A.Config.Property.Named.google.maps.apiKey')

        def ecodataBaseUrl = grailsApplication.config.getProperty("ecodata.baseURL")
        if (ecodataBaseUrl){
            grailsApplication.config.ecodata.service.url = ecodataBaseUrl + '/ws'
            log.info('Ecodata service URL:' + grailsApplication.config.ecodata.service.url)
        }else
            throw new Exception('You need to define ecodata base URL')

        def meritBaseUrl = grailsApplication.config.getProperty("merit.baseURL")
        if (meritBaseUrl){
            grailsApplication.config.merit.project.url = meritBaseUrl + '/project/index'
            log.info('Merit project URL:' + grailsApplication.config.merit.project.url)
        }else
            throw new Exception('You need to define ecodata base URL')
        //It is used by redirect and others,
        grailsApplication.config.grails.serverURL = grailsApplication.config.server.serverURL

        grailsApplication.config.upload.images.url = grailsApplication.config.grails.serverURL + '/image?id='
        grailsApplication.config.upload.file.url = grailsApplication.config.grails.serverURL + '/file?id='

        def spatial = grailsApplication.config.getProperty("spatial.baseURL")
        if(spatial){
            log.info(spatial)
            grailsApplication.config.spatial.layersUrl = spatial+"/layers-service"
            grailsApplication.config.spatial.geoserverUrl = spatial+"/geoserver"
            grailsApplication.config.spatial.wms.url = spatial+"/geoserver/ALA/wms?"
            grailsApplication.config.spatial.wms.cache.url =spatial+"/geoserver/gwc/service/wms?"
        }else
            throw new Exception('You need to define spatial portal URL')

    }
}
