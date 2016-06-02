Given(/^user has created a trip$/) do
  @trip_id = TravellerHelper.create_new_trip
  expect(@trip_id.nil?).to eq false
  TravellerHelper.logout
  @wait.until { !(@driver.current_url.include? 'requested_trip') }
end

Given(/^admin is logged in$/) do
  AdminHelper.login_admin
  @admin_dash_page = AdminDashboardPage.new
  @wait.until { @admin_dash_page.displayed? }
end

Given(/^admin opens trip detail page$/) do
  @admin_end_trip_page = AdminHelper.open_trip_page(@trip_id)
end

When(/^admin set tag and mark trip active$/) do
  expect(@admin_end_trip_page.set_tag_and_mark_active).to eq true
end

Then(/^tag and status should get changed$/) do
  expect(@admin_end_trip_page.tag_set_and_marked_active?(@trip_id)).to eq true
end
