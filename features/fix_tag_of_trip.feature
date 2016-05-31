Feature: Fix tag of trip

  Background: Given user is on trip page on admin end
    Given user has created a trip
    Given admin is logged in

  Scenario: Admin changes tag of trip
    When admin changes tag of trip
    Then tag should get changed
