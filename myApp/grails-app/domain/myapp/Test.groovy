package myapp

class Test {

    String fName
    String lName

    static constraints = {
        fName maxSize: 255
        lName maxSize: 255
    }
}
