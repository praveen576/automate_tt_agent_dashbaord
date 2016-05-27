class NewTripPage < SitePrism::Page

  set_url 'http://ttuser:ttuser@agent.ttdev.in/requested_trips/new'

  element :to_location, '#to_location'
  element :from_location, '#from_location'
  element :start_date, '#start_date'
  element :calender_date, '.ui-datepicker-group-last table tr:nth-child(3) td:nth-child(1) a'
  element :trip_days, '#requested_trip_trip_days'
  element :phone_no, '#requested_trip_phone_no'
  element :email, '#usr_email'
  element :submit_f1, '#request_but'

  def fill_and_submit_F1
    to_location.set 'Sri Lanka'
    from_location.set 'Noida'
    start_date.set "#{(Date.today + 15).to_s}"
    start_date.native.send_key :tab
    trip_days.set '4'
    phone_no.set '12341234'
    email.set "#{ Time.now.to_s.gsub(/[ :+-]/, '_') }@mailinator.com"
    submit_f1.click
  end
end