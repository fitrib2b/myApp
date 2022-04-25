package myapp.checklist

import grails.transaction.Transactional
import myapp.Checklist
import myapp.ChecklistCommand

import java.text.DateFormat
import java.text.SimpleDateFormat

@Transactional
class ChecklistService {

    Date dateConverter(String dateStr) {
        //'yyyy-MM-dd kk:mm:ss'
        println(dateStr)
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'kk:mm")
        Date done = formatter.parse(dateStr)
        return done
    }

    @Transactional
    def saveChecklist(ChecklistCommand cmd) {
        Checklist cl = new Checklist()
        cl.taskName = cmd.taskName
        cl.dateCreated = cmd.dateCreated
        cl.complete = cmd.complete
        cl.complete ? {cl.dateCompleted = cmd.dateCompleted} : {cl.dateCompleted = null}
        cl.save()
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
    def updateChecklist(ChecklistCommand cmd){
        def checkList = Checklist.get(cmd.id)
        checkList.taskName = cmd.taskName
        checkList.complete = cmd.complete
        checkList.dateCompleted = cmd.dateCompleted
        checkList.save()
    }
}
