Given(/^a trip is assigned to an agent$/) do
  @trip_id = TravellerHelper.create_new_trip
  expect(@trip_id.nil?).to eq false
  
  TravellerHelper.logout
  @wait.until { !(@driver.current_url.include? 'requested_trip') }

  AdminHelper.login_admin
  @admin_dash_page = AdminDashboardPage.new
  @wait.until { @admin_dash_page.displayed? }

  @admin_end_trip_page = AdminHelper.open_trip_page(@trip_id)
  expect(@admin_end_trip_page.set_tag_and_mark_active).to eq true
  expect(@admin_end_trip_page.tag_set_and_marked_active?(@trip_id)).to eq true

  AdminHelper.logout_admin
  @wait.until { !(@driver.current_url.include? 'dashboard') }  
end


Given(/^agent is logged in$/) do
  @impersonate_link = 'http://ttuser:ttuser@agent.ttdev.in/handle_link_authentication?token=%242a%2410%24aAN.HJX0Ltn8wBNSt4BJYu'
  @driver.visit @impersonate_link
  @rapid_fire_page = AgentRapidFirePage.new
  @wait.until{ @rapid_fire_page.displayed? }
end

When(/^agent opens create quote funnel$/) do
  @agent_create_quote_page = AgentCreateQuotePage.new
  @agent_create_quote_page.load
  @wait.until { @agent_create_quote_page.displayed? }
end

Then(/^trip should be shown in create quote funnel$/) do
  trip_link = @agent_create_quote_page.get_trip_link_if_exists?(@trip_id)
  expect(trip_link.text.include? @trip_id).to eq true
  expect(trip_link).not_to eq false
end
