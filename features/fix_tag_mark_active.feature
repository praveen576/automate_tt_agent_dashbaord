Feature: Fix tag of trip

  Background: Given user is on trip page on admin end
    Given user has created a trip
    And admin is logged in
    And admin opens trip detail page

  Scenario: Admin changes tag of trip
    When admin set tag and mark trip active
    Then tag and status should get changed
