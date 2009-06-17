Feature: Manage User Profiles
  In order to keep the world updated of my details
  As a website user
  I want to keep my profile up to date

  Scenario: edit profile when logged in
    Given the following user records
      | username | password | admin |
      | bob      | secret   | false |
      | admin    | secret   | true  |
    And I am logged in as "admin" with password "secret"
    When I visit profile for bob
    Then I should see "Edit Profile"
    