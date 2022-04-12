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

        new Checklist(taskName: tName, complete: done, dateCompleted: dateCompleted).save()
    }
}
