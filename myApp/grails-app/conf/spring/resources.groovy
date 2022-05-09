import myApp.UserPasswordEncoderListener
import myApp.UserPasswordEncoderListener
import myApp.UserPasswordEncoderListener
// Place your Spring DSL code here
beans = {
    userPasswordEncoderListener(UserPasswordEncoderListener, ref('hibernateDatastore'))
    userPasswordEncoderListener(UserPasswordEncoderListener, ref('hibernateDatastore'))
    userPasswordEncoderListener(UserPasswordEncoderListener, ref('hibernateDatastore'))
}
