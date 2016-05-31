Feature: Create a trip

  Background: Given user is on traveller dashboard page
  	Given user is on traveller dashboard page

  Scenario: create a trip with  valid data
    When user fills F1 page and submit
    And user fills F2 and submit
    Then user should get a trip id
