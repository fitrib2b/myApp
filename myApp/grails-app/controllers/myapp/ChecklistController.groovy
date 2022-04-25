package myapp

import myapp.checklist.ChecklistService

class ChecklistController {

    ChecklistService checklistService

    def index() {}

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

        cmd.validate() ? checklistService.saveChecklist(cmd) : cmd.errors.allErrors.each {println it}
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

        render template: 'editModal', model: [checklist: checklist]
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
    def update(ChecklistCommand cmd) {

        //saving update
        println("cmd validate:" + cmd.validate())

        if (cmd.validate()) {
            checklistService.updateChecklist(cmd)
        } else {
            cmd.errors.allErrors.each {
                println it
            }
        }

        redirect(action: 'search')
    }

//    def deleteModal(){
//        Checklist checklist = Checklist.get(params.id)
//        render template: 'deleteModal', model: [checklist: checklist]
//    }

    def delete() {

        String id = params.delete
//        println("ID: "+id)
        checklistService.deleteChecklist(id)
        redirect(action: 'search')
    }
}
