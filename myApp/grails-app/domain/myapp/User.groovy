package myapp

class User {

    String id
    String name
    String icno

    static constraints = {
//        id generator: 'identity', column: 'id', type: 'integer'
        id column: 'id', generator: 'uuid', type: 'string'
        name maxSize: 255, nullable: false
        icno nullable: false, maxSize: 12
    }

}
