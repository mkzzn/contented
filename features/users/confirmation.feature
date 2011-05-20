@wip
Feature: User Confirmation
  In order to confirm that I am who I say that I am
  As a newly registered site user
  I want to be able to enter a confirmation token that was emailed to me

  Background:
    Given user "goliath"
    And I am on the user confirmation page


  Scenario: User successfully confirms registration
    Given I enter the correct confirmation token for user "goliath"
    When I submit the confirmation
    Then I should be on the homepage
    And I should see that I'm logged in as user "goliath"

  Scenario: User enters bogus confirmation
    Given I enter an invalid confirmation token
    When I submit the confirmation
    Then I should still be on the confirmation page
    And I should see that I am not logged in
