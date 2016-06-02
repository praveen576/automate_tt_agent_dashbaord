Given(/^user is on traveller dashboard page$/) do
  @page = NewTripPage.new
  @page.load
  @page.wait_for_to_location 10
end

When(/^user fills F1 page and submit$/) do
  @page.fill_and_submit_F1
end

Then(/^user should get a trip id$/) do
  @trip_customize_page = TripCustomizePage.new
  @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  @wait.until { @trip_customize_page.displayed? }
  trip_id = @trip_customize_page.get_trip_id  
  p "trip id is #{trip_id}"
  expect(trip_id.nil?).to eq false
end

When(/^user fills F2 and submit$/) do
  @trip_customize_page.fill_and_submit_F2
end

Then(/^user should get home page$/) do
  @traveller_home_page = TravellerHomePage.new
  @wait.until { @traveller_home_page.displayed? }
end
