Feature: User Confirmation
  In order to confirm that I am who I say that I am
  As a newly registered site user
  I want to be able to enter a confirmation token that was emailed to me

  Background:
    Given I am on the user confirmation page
    And user "goliath" with confirmation token "alphasauce"

  Scenario: User successfully confirms registration
    Given I enter login "goliath" and confirmation token "alphasauce"
    When I submit the confirmation
    Then I should be on the site homepage
    And I should see that I'm logged in as user "goliath"

  Scenario: User enters bogus confirmation
    Given I enter login "goliath" and confirmation token "wolfpack"
    When I submit the confirmation
    Then I should be on the user confirmation page
    And I should see that I am not logged in
