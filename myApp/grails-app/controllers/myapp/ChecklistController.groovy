package myapp

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import myapp.checklist.ChecklistService
import org.springframework.context.MessageSource

@Secured('ROLE_ADMIN')
class ChecklistController {

    ChecklistService checklistService
    MessageSource messageSource

    def index() {
        search()
    }

    def create() {
        render view: 'create'
    }

//    def save() {
//        String tName = params.taskName
//        Boolean done = params.complete
//        Date dCreate = params.dateCreated
//
//        Date dDone = null
//        if (params.complete) {
//            dDone = params.dateCompleted
//        }
//
//        checklistService.saveChecklist(tName, done, dCreate, dDone)
//        render view: 'create'
//    }

    def save(ChecklistCommand cmd) {

        cmd.validate() ?
                checklistService.createChecklist(cmd) :
                cmd.errors.allErrors.each {
                    println it
                }
        search()
    }

    def search() {

        def results
        String filter = params.filter

        if (params.search) {
            String strText = "%" + params.search + "%"
            results = checklistService.getSearchResult(strText, filter)
        } else {
            results = checklistService.getSearchResult("%", filter)
        }

        render view: "search", model: [results: results]
    }

    def edit() {

        Checklist checklist = Checklist.get(params.id)

//        render template: 'editModal', model: [checklist: checklist]
        render([checklist: checklist] as JSON)
    }

    //update without command
//    def update() {
//
//        String id = params.id
//        String tName = params.name
//        Date dtDone = null
//
//        Boolean done
//        if (params.completed) {
//            done = params.completed
//            dtDone = checklistService.dateConverter(params.dtCompleted)
//
//        } else {
//            done = false
//
//        }
//
//        checklistService.updateChecklist(id, tName, done, dtDone)
//        redirect(action: 'search')
//    }

    //update with command
    def update(ChecklistUpdateCommand cmd) {

        //check whether it passed the validation in the cmd
//        println("cmd validate:" + cmd.validate())

        //saving update
        if (cmd.validate()) {
            checklistService.updateChecklist(cmd)
        } else {
            cmd.errors.allErrors.each { println it }
        }

        Map resp = cmd.resolveErrors(cmd.errors, request.locale, messageSource) + [redirect: "/checklist/search"]

        render(resp as JSON)
    }

    def delete() {

        String id = params.delete
//        println("ID: "+id)
        checklistService.deleteChecklist(id)
        redirect(action: 'search')
    }
}
