Feature: Create a story
  In order to tell a story about refugees in pakistan
  As a humanitarian
  I want to let people create a new story
  
  Scenario: A user creates a new story from scratch
    Given I am logged in
    When I follow "Start a story"
    Then I should be on the new story page
