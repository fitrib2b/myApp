package myapp

import myapp.checklist.ChecklistService

class ChecklistController {

    ChecklistService checklistService

    def index() { }

    def create() {
        render view:'create'
    }

    def save() {
        String tName = params.taskName
        Boolean done = params.complete
        Date dCreate = params.dateCreated

        Date dDone = null
        if (params.complete) {
            dDone = params.dateCompleted
        }

        checklistService.saveChecklist(tName, done, dCreate, dDone)
        render view: 'create'
    }

    def search() {

        def results
        String filter = params.filter

        if (params.search) {
            String strText = "%"+params.search+"%"
            results = checklistService.getSearchResult(strText, filter)
        } else {
            results = checklistService.getSearchResult("%", filter)
        }

        render view: "search", model: [results: results]
    }

    def edit() {
        //println("edit id="+params.id)
        Checklist checklist = Checklist.get(params.id)

//        render view: 'edit', model: [checklist: checklist]
//        render (checklist.properties.subMap('id', 'taskName') as JSON)
        render template: 'editModal', model: [checklist: checklist]
//        render model: [checklist: checklist]
    }
    def update(){

        String id = params.id
        String tName = params.name
        Date dtDone

        Boolean done
        if(params.completed){
            done = params.completed
            dtDone = params.dCompleted
        }else{
            done = false
        }

        checklistService.updateChecklist(id, tName, done, dtDone)
        redirect(action:'search')
    }

//    def deleteModal(){
//        Checklist checklist = Checklist.get(params.id)
//        render template: 'deleteModal', model: [checklist: checklist]
//    }

    def delete(){

        String id = params.delete
//        println("ID: "+id)
        checklistService.deleteChecklist(id)
        redirect(action: 'search')
    }
}
