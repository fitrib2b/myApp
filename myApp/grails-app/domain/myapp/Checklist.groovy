package myapp

class Checklist {

    String id
    String taskName
    boolean complete
    Date dateCreated
    Date dateCompleted

    static mapping = {
        complete type: 'yes_no'
    }

    static constraints = {
        id column: 'id', generator: 'uuid', type: 'string'
        taskName maxSize: 255, nullable: false
        complete nullable: true
        dateCreated date: true, nullable: false
        dateCompleted date: true, nullable: true
    }

}
