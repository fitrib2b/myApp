package myapp.checklist

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
        complete nullable: false
        dateCreated date: true, nullable: false //, validator: {val -> validate(val)}
        dateCompleted date: true, nullable: true //, validator: {val -> validate(val)}
    }

}
