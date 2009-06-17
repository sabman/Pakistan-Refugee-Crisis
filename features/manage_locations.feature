Feature: Manage Locations
  In order to know the 
  As a journalist
  I want to create locations for a story

  @focus
  Scenario: create a new location for an existing story
    Given a Story.make(:user => :shoaib) exists
    And user is logged in
    When they click on add location
    Then I should see a map and text field for the location
  
  
  

  

  