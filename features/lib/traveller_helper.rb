module TravellerHelper

  def self.create_new_trip
    @new_trip_page = NewTripPage.new
    @new_trip_page.load
    @new_trip_page.wait_for_to_location 10
    @new_trip_page.fill_and_submit_F1

    @trip_customize_page = TripCustomizePage.new
    @wait = Selenium::WebDriver::Wait.new timeout: 20
    @wait.until { @trip_customize_page.displayed? }
    
    @trip_id = @trip_customize_page.get_trip_id  
    p "trip_id: #{ @trip_id }"
    @trip_customize_page.fill_and_submit_F2

    @traveller_home_page = TravellerHomePage.new
    @wait.until { @traveller_home_page.displayed? }

    @trip_id
  end

  def self.logout
    @traveller_home_page.get_logout
  end
end
