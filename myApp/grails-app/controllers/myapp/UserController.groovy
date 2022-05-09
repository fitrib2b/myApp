package myapp

import grails.plugin.springsecurity.annotation.Secured
import myApp.User

@Secured('ROLE_ADMIN')
class UserController {

    static scaffold = User

    def index() {
        render view: 'login'
    }

    def login() {
        render view: 'checklist/search'

    }
    def logout(){
        render view: 'user/login'
    }
}
