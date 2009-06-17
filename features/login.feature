Feature: Start a story
  In order to create a story
  As a user 
  I want to be able to login

  Scenario: Not logged in
    Given I am on "the homepage"
    When I follow "Start a Story"
    Then I should see "Username" 
    And I should see "Password" 
    And I should see "Login"
    And I should see "Register"
  
  
  
