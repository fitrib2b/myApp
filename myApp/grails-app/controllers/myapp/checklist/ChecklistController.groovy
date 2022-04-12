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

    def search() {
//        def results = Checklist.findAll(params.search)
        render view: "search"
    }

    def getSearchResult(){

        def results = Checklist.findAllByTaskName(params.search)
        println(params.search);

        render view: "search", model: [results: results]
    }
}
