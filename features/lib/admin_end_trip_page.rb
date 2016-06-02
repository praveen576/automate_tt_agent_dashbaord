class AdminEndTripPage < SitePrism::Page

  set_url 'http://agent.ttdev.in/requested_trips/{trip_id}'
  
  element :add_admin_comment_tag_button, '#add_admin_comment'
  element :edit_tag_link, 'a.ga_event:nth-child(5)'
  element :tags_field, '#tags_for_admin'
  element :active_radio, '#status_Active'
  element :edit_request_button, "[value='Edit Request']"
  element :success, '.content'
  element :status_text, '#shared_content_show > div:nth-child(13) > fieldset:nth-child(1) > table:nth-child(4) > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(2) b'
  element :tag_text, '#shared_content_show > div:nth-child(13) > fieldset:nth-child(1) > table:nth-child(4) > tbody:nth-child(1) > tr:nth-child(18) > td:nth-child(2)'

  def set_tag_and_mark_active
    add_admin_comment_tag_button.click
    edit_tag_link.click
    tags_field.set 'SriLanka_5_Aziz_333_Boom_LankaV(agent)'
    active_radio.click
    edit_request_button.click
    wait_for_success 5
    has_success? ? true : false
  end

  def tag_set_and_marked_active?(trip_id)
    self.load(trip_id: trip_id)
    wait_for_status_text 40
    wait_for_tag_text 40
    (status_text.text.include? 'Active') &&
    (tag_text.text.include? 'SriLanka_5_Aziz_333_Boom_LankaV(agent)')
  end
end
