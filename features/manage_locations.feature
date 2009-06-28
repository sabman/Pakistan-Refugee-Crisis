Feature: Manage Locations
  In order to know the 
  As a journalist
  I want to create locations for a story

  @focus
  Scenario: create the location of home town for an existing family story
    Given a story "shoaibs_story" exists
    And I am on story page
    When I follow "map this family's home town"
    Then I should see "locate on map"
    And I should see "enter address"  
  
  

  

  