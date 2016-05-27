class TravellerDashboardPage < SitePrism::Page
  
  set_url 'http://ttuser:ttuser@agent.ttdev.in'

  element :destination_name, '#destinations_id'
  element :to_location, '#to_location'
  element :from_location, '#from_location'
  element :pick_start_date, '#start_dates'
  element :calender_date, '.ui-datepicker-group-last table tr:nth-child(3) td:nth-child(4) a'
  element :trip_days, '#js_modal_no_of_days'
  element :trip_stage, '#stage option[value="3"]'
  element :traveller_phone_no, '#usr_phone'
  element :traveller_email, '#usr_email'
  element :F1_request_button, '#request_but'

  def fill_and_submit_F1
    to_location.set 'Sri Lanka'
    from_location.set 'Noida'
    pick_start_date.click
    calender_date.click
    trip_days.set '4'
    trip_stage.click
    traveller_phone_no.set '12341234'
    traveller_email.set "#{ Time.now.to_s.gsub(/[ :+-]/, '_') }@mailinator.com"
    F1_request_button.click
  end

  def get_trip_id
    trip_url = @driver.current_url
    trip_regx = %r{http://www.agent.ttdev.in/requested_trips/([\d]+)/customize}
    (trip_regx.match trip_url)[1]
  end
end