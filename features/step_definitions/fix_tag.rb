Given (/^user has created a trip$/) do
  @new_trip_page = NewTripPage.new
  @new_trip_page.load
  @new_trip_page.wait_for_to_location 10
  @new_trip_page.fill_and_submit_F1

  @trip_customize_page = TripCustomizePage.new
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  wait.until { @trip_customize_page.displayed? }
  
  @trip_id = @trip_customize_page.get_trip_id  
  expect(trip_id.nil?).to eq false
end

Given (/^admin is logged in$/) do
  @login_page = LoginPage.new
  @login_page.load
  @login_page.wait_for_user_email 10
  @login_page.login_as_admin

  @admin_dash_page = AdminDashboardPage.new
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  wait.until { @admin_dash_page.displayed? }
end

When (/^admin changes tag of trip$/) do

end

Then (/^tag should get changed$/) do

end
