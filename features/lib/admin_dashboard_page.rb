class AdminDashboardPage < SitePrism::Page

  set_url 'http://agent.ttdev.in/admins/dashboard'

  element :my_account, '#account_link .first'
  element :signout_link, '#settings li:nth-child(3) a'

  def get_logout
    wait_for_my_account 10
    my_account.click
    signout_link.click
  end
end
