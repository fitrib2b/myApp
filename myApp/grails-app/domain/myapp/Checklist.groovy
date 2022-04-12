package myapp

class Checklist {

    String id
    String taskName
    boolean complete
    Date dateCreated
    Date dateCompleted

    static constraints = {
        id column: 'id', generator: 'uuid', type: 'string'
        taskName maxSize: 255, nullable: false
        complete inList: ['y','n'], nullable: false
        dateCreated date: true, nullable: false, validator: {val -> validate(val)}
        dateCompleted date: true, nullable: false, validator: {val ->validate(val)}
    }

}
