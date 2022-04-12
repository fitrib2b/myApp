package myapp.checklist

import grails.transaction.Transactional

@Transactional
class ChecklistService {

    def serviceMethod() {

    }

    @Transactional
    def saveChecklist(String tName, Boolean done, Date dCreate, Date dDone) {
        new Checklist(taskName: tName, complete: done, dateCreated: dCreate, dateCompleted: dDone).save()
    }
}
