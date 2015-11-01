package au.org.ala.biocollect

import au.org.ala.biocollect.merit.ActivityService
import au.org.ala.biocollect.merit.DocumentService
import au.org.ala.biocollect.merit.MetadataService
import au.org.ala.biocollect.merit.PreAuthorise
import au.org.ala.biocollect.merit.ProjectService
import au.org.ala.biocollect.merit.SpeciesService
import au.org.ala.biocollect.merit.UserService
import grails.converters.JSON
import org.apache.http.HttpStatus

class ProjectActivityController {
    ProjectActivityService projectActivityService
    SpeciesService speciesService
    DocumentService documentService
    ProjectService projectService
    UserService userService
    ActivityService activityService

    static ignore = ['action', 'controller', 'id']

    @PreAuthorise(accessLevel = 'admin', projectIdParam = "projectId")
    def ajaxCreate() {

        def values = request.JSON
        log.debug "values: " + (values as JSON).toString()
        Map result = projectActivityService.create(values)

        if (result.error) {
            response.status = 500
        } else {
            render result as JSON
        }
    }

    def ajaxUpdate(String id) {
        def values = request.JSON
        def pActivity = projectActivityService.get(params.id)
        def project = projectService.get(pActivity?.projectId)
        String userId = userService.getCurrentUserId()

        Map result
        if (!userId) {
            response.status = 401
            result = [status: 401, error: "Access denied: User has not been authenticated."]
        } else if (!(projectService.isUserAdminForProject(userId, params.projectId) && pActivity)) {
            response.status = 401
            result = [status: 401, error: "Access denied: User is not an admin of this project - ${project?.projectId}"]
        } else {
            def documents = values.remove('documents')
            result = projectActivityService.update(id, values)
            if ((!result.statusCode || result.statusCode == HttpStatus.SC_OK)) {
                documents?.each { doc ->
                    if (doc.status == "deleted") {
                        result.doc = documentService.updateDocument(doc)
                    } else if (!doc.documentId) {
                        doc.projectActivityId = pActivity.projectActivityId
                        result.doc = documentService.saveStagedImageDocument(doc)
                    }
                }
            }
        }

        render result as JSON
    }

    /**
     * Delete activities and records by project activityId
     * @param id projact activity id
     * @return
     */

    def unpublish(String id) {
        def pActivity = projectActivityService.get(params.id)
        def project = projectService.get(pActivity?.projectId)
        String userId = userService.getCurrentUserId()

        Map result
        if (!userId) {
            response.status = 401
            result = [status: 401, error: "Access denied: User has not been authenticated."]
        } else if (!projectService.isUserAdminForProject(userId, params.projectId)) {
            response.status = 401
            result = [status: 401, error: "Access denied: User is not an admin of this project - ${project?.projectId}"]
        } else if (pActivity) {
            def code = activityService.deleteByProjectActivity(pActivity.projectActivityId)
            if (code == HttpStatus.SC_OK) {
                flash.message = "Successfully unpublished the survey."
                result = projectActivityService.update(id, [published: false])
            } else {
                response.status = code
                result = [status: code, error: "Error unpublishing the project activity ${pActivity.projectActivityId}"]
            }
        } else {
            response.status = 400
            result = [status: 400, error: "Invalid project activity id ${params.id}"]
        }

        render result as JSON
    }

    def delete() {
        def pActivity = projectActivityService.get(params.id)
        def project = projectService.get(pActivity?.projectId)
        String userId = userService.getCurrentUserId()

        Map result
        if (!userId) {
            response.status = 401
            result = [status: 401, error: "Access denied: User has not been authenticated."]
        } else if (!(projectService.isUserAdminForProject(userId, params.projectId) && pActivity)) {
            response.status = 401
            result = [status: 401, error: "Access denied: User is not an admin of this project - ${project?.projectId}"]
        } else {
            def resp = projectActivityService.delete(params.id)
            if (resp == HttpStatus.SC_OK) {
                result = [status: resp, text: 'deleted']
            } else {
                response.status = resp
                result = [status: resp, error: "Error deleting the survey, please try again later."]
            }
        }

        render result as JSON
    }

    @PreAuthorise(accessLevel = 'admin', projectIdParam = "projectId")
    def ajaxAddNewSpeciesLists() {

        def postBody = request.JSON
        log.debug "Body: " + postBody
        log.debug "Params:"
        params.each { println it }

        def values = [:]
        postBody.each { k, v ->
            if (!(k in ignore)) {
                values[k] = v
            }
        }
        log.debug "values: " + (values as JSON).toString()
        def response = speciesService.addSpeciesList(postBody);
        def result
        if (response?.resp?.druid) {
            result = [status: "ok", id: response.resp.druid]
        } else {
            result = [status: 'error', error: "Error creating new species lists, please try again later."]
        }
        render result as JSON
    }
}
