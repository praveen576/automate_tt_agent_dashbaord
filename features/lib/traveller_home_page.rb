class TravellerHomePage < SitePrism::Page

  set_url_matcher %r{http://agent.ttdev.in/requested_trips/([\d]+).*}

  element :welcome, 'li.login:nth-child(5)'
  element :logout, '.js-login-links > li:nth-child(4)'

  def get_logout
    welcome.click
    logout.click
  end
end
