class TripCustomizePage < SitePrism::Page

  set_url_matcher %r{http://agent.ttdev.in/requested_trips/([\d]+)/customize}
  
  element :hotel_category, '#hotel_category > label:nth-child(2)'
  element :submit_trip_f2, '#customization_submit_button'

  def get_trip_id
    trip_url = self.current_url
    trip_regx = %r{http://agent.ttdev.in/requested_trips/([\d]+)/customize}
    trip_id = (trip_regx.match trip_url)[1]
  end

  def fill_and_submit_F2
    wait_for_hotel_category 20
    hotel_category.click
    submit_trip_f2.click
  end
end
