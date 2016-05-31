Given(/^user is on traveller dashboard page$/) do
  @page = NewTripPage.new
  @page.load
  @page.wait_for_to_location 10
end

When(/^user is on trip F1 page$/) do
  destination = @page.destination_name
  destination.set 'test_destination'
  destination.native.send_key :return
end

When(/^user fills F1 page and submit$/) do
  @page.fill_and_submit_F1
end

When(/^user should get a trip id$/) do
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  wait.until { @driver.current_url.include? 'customize' }

  trip_url = @driver.current_url
  trip_regx = %r{http://agent.ttdev.in/requested_trips/([\d]+)/customize}
  trip_id = (trip_regx.match trip_url)[1]
  p "trip id is #{trip_id}"
  expect(trip_id.nil?).to eq false
end