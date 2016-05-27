class TripCustomizePage < SitePrism::Page

  set_url_matcher %r{http://www.agent.ttdev.in/requested_trips/([\d]+)/customize}
  
  element :hotel_category, '#hotel_category label'
  element :submit_trip_f2, '#customization_submit_button'
end