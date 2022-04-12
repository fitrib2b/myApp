package myapp.checklist

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
        Date dDone = params.dateCompleted
        checklistService.saveChecklist(tName, done, dCreate, dDone)


    }
}
