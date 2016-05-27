Feature: Create a trip

  Background: Given i am on traveller dashboard page
  	Given i am on traveller dashboard page

  Scenario: create a trip with  valid data
    When user fill F1 page and submit
    Then user should get a trip id