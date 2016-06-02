class AgentCreateQuotePage < SitePrism::Page
  set_url 'http://agent.ttdev.in/agents/dashboard#requirment'
  element :main_div, '#small_trip_boxes'

  def get_trip_link_if_exists?(trip_id)
    begin
      wait_for_main_div 30
      trip_link = find("#trip_id_" + trip_id)
    rescue Exception => e
      p e.message
      return false
    end
  end
end
