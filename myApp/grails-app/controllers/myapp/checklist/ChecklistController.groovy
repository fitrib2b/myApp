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

        render view: 'create'

    }

    def search() {
//        def results = Checklist.findAll(params.search)
        if(params.search==null){
            render view: "search"
        }else{
            searchResult()
        }
        render view: "search"
    }

    def searchResult(){

        String strText = "%"+params.search+"%"
        def results = checklistService.getSearchResult(strText)
        render view: "search", model: [results: results]
    }

    def update(){

    }

    def delete(){

        String id = params.id
        checklistService.deleteChecklist(id)
        String strText = "%"+"%"
        def results = checklistService.getSearchResult(strText)
        render view: "search", model: [results: results]
    }
}
