Given (/^user is on login page$/) do
  @login_page = LoginPage.new
  @login_page.load
  @login_page.wait_for_user_email 10
end

When (/^user login as admin$/) do
  @login_page.login_as_admin
end

Then (/^user should be redirected to admin dashboard page$/) do
  @admin_dash_page = AdminDashboardPage.new
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  wait.until { @admin_dash_page.displayed? }
end
