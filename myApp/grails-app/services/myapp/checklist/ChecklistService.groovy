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

    def getSearchResult(String strText){
        def results = Checklist.findAllByTaskNameIlike(strText,[readOnly: true])
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
