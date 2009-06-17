Feature: Donate to a displaced family who's needs have be highlighted using paypal
  In order to help the displaced people in Pakistan
  As a caring user with some extra money
  I want to donate some money 
  
  Scenario: Logged in and want to donate
    Given I am at story page
    When I click one dollar donation
    And I click "donation to this family"
    Then I should see paypal login page
  
  
  

  
