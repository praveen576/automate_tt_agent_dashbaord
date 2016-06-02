Given(/^agent has impersonate link$/) do
  @impersonate_link = 'http://ttuser:ttuser@agent.ttdev.in/handle_link_authentication?token=%242a%2410%24aAN.HJX0Ltn8wBNSt4BJYu'
end

When(/^agent opens impersonate link$/) do
  @driver.visit @impersonate_link
end

Then(/^agent should get rapid fire page$/) do
  @rapid_fire_page = AgentRapidFirePage.new
  @wait.until{ @rapid_fire_page.displayed? }
end
