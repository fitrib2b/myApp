package myapp.checklist

import grails.transaction.Transactional

@Transactional
class ChecklistService {

    def serviceMethod() {

    }

    @Transactional
    def saveChecklist(String tName, Boolean done, Date dCreate, Date dDone) {

        Date dateCompleted = new Date()
        if (!done) {
            dateCompleted = null
        }

        new Checklist(taskName: tName, dateCreated: dCreate, complete: done, dateCompleted: dateCompleted).save()
    }

    def List<Checklist>getSearchResult(String strText){
        def results = Checklist.findAllByTaskNameIlike(strText,[readOnly: true])
        return results
    }
}
