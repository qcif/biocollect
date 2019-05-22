package au.org.ala.biocollect

import grails.converters.JSON
import net.sf.json.JSONNull
import grails.core.GrailsApplication

class BootStrap {
    GrailsApplication grailsApplication

    def init = { servletContext ->
        JSON.createNamedConfig("nullSafe", { cfg ->
            cfg.registerObjectMarshaller(JSONNull, {return ""})
        })
    }
    def destroy = {
    }
}
