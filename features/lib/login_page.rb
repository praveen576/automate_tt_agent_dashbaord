class LoginPage < SitePrism::Page

  set_url 'http://ttuser:ttuser@agent.ttdev.in/users/sign_in'

  element :user_email, '#devise-sign-in-form #user_new #user_email'
  element :user_password, '#devise-sign-in-form #user_new #user_password'
  element :submit, '#devise-sign-in-form #user_new [type="submit"]'

  def login_as_admin
    user_email.set 'praveen.kumar@traveltriangle.com'
    user_password.set 'travel@2342'
    submit.click
  end
end
