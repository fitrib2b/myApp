package myapp.checklist

import grails.transaction.Transactional
import myapp.Checklist

@Transactional
class ChecklistService {

    def serviceMethod() {

    }

    @Transactional
    def saveChecklist(String tName, Boolean done, Date dtCreate, Date dtCompleted) {
        new Checklist(taskName: tName, dateCreated: dtCreate, complete: done, dateCompleted: dtCompleted).save()
    }

    def getSearchResult(String strText, String filter) {
        def results = Checklist.findAllByTaskNameIlike(strText,[readOnly: true])
        if (filter) {
            results = results.findAll { it.complete == filter.toBoolean() }
        }

        return results
    }

    @Transactional
    def deleteChecklist(String id){
        def checkList = Checklist.get(id)
        checkList.delete()
    }

    @Transactional
    def updateChecklist(String id, String tName, boolean comp, Date dComp){
        def checkList = Checklist.get(id)
        checkList.taskName = tName
        checkList.complete = comp
        checkList.dateCompleted = dComp
        checkList.save()
    }
}
