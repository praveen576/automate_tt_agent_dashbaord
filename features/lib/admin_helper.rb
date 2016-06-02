module AdminHelper
  def self.login_admin
    @login_page = LoginPage.new
    @login_page.load
    @login_page.wait_for_user_email 10
    @login_page.login_as_admin
  end

  def self.open_trip_page(trip_id)
    @admin_end_trip_page = AdminEndTripPage.new
    @admin_end_trip_page.load(trip_id: trip_id)
    @wait = Selenium::WebDriver::Wait.new timeout: 20
    @wait.until { @admin_end_trip_page.displayed? }
    @admin_end_trip_page
  end

  def self.logout_admin
    @admin_dash_page = AdminDashboardPage.new
    @admin_dash_page.load
    @admin_dash_page.get_logout
  end
end
