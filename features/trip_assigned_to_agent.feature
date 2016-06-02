Feature: Trip assigned to an agent
  
  Background: Given an agent is logged in
    Given a trip is assigned to an agent 
    And agent is logged in

  Scenario: Assigned trip should be shown in create quote funnel
    When agent opens create quote funnel
    Then trip should be shown in create quote funnel