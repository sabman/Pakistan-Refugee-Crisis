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
    Given a user exists with username: "shoaib", password: "secret", password_confirmation: "secret", email:"saburq@gmail.com"
    And I am not logged in 
    When I go to the new story page
    Then I should see "Don't have an account? Sign up!"

  Scenario: Story Creation - logged in
    Given a user exists with username: "shoaib", password: "secret", password_confirmation: "secret", email:"saburq@gmail.com"
    And I am logged in 
    When I go to the new story page
    Then I should see the new story page

  Scenario: Story Deletion - not owned by logged in user
    Given :shoaibs_story exists
    And I am on the story page
    When I go to delete the story
    Then I should see "You cannot delete other users stories"

  Scenario: Story Deletion - owned by logged in user
    Given :shoaibs_story exists
    And I am on the story page
    When I go to delete the story
    Then I should see "Story deleted"

  Scenario: Story creation with attachment - owner logged in
    Given I am logged in
    And I am on the new story page
    When I attach a photograph
    And click "Create story"
    Then I should see the story page with a photograph
  
  
  