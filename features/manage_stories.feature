Feature: Manage Stories
  In order to create stories
  As an author
  I want to create
  
  Scenario: Stories List
    Given a story exists with title: "Village Destroyed"
    And a story exists with title: "Residents Displaced"
    When I go to the stories page
    Then I should see "Village Destroyed"
    And I should see "Residents Displaced" 

  Scenario: Story Creation - not logged in
    Given a user exists with username: "shoaib", password: "secret", password_confirmation: "secret"
    And I am not logged in 
    When I go to the new story page
    Then I should see "Don't have an account? Sign up!"
    