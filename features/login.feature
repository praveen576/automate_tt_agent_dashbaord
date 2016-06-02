Feature: Login to traveltriangle

  Background: Given user is on login page
    Given user is on login page

  Scenario: login as admin
    When user login as admin
    Then user should be redirected to admin dashboard page
