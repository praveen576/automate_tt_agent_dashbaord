Feature: Fix tag of trip

  Background: Given agent has impersonate link
    Given agent has impersonate link

  Scenario: agent should login on visiting impersonate link
    When agent opens impersonate link
    Then agent should get rapid fire page

