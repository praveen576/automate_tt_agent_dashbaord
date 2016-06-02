require 'capybara'
require 'capybara/cucumber'
require 'cucumber'
require 'site_prism'
require 'selenium-webdriver'
require 'rspec/expectations'

# Begin Section-1---Uncomment section-1 and comment section-2 for headless testing
# require 'capybara/poltergeist'

# Capybara.register_driver :poltergeist do |app|
#   options = { browser: :chrome, timeout: 100 }
#   Capybara::Poltergeist::Driver.new(app, options)
# end

# Capybara.javascript_driver = :poltergeist

# Before do |scenario|
#   Capybara.current_driver = :poltergeist
#   @driver = page.driver
# end
# --End Section-1-----------------------------------------------------------

# Begin Section-2---Uncomment section-2 and comment section-1 for browser testing
Capybara.default_driver = :selenium

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Before do
  Capybara.current_driver = :selenium
  @driver = page.driver
  # page.driver.browser.manage.window.maximize
  @wait = Selenium::WebDriver::Wait.new timeout: 20
end
#--End Section-2-----------------------------------------------------------
