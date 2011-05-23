Feature: User Sign-Out
  In order to prevent others from changing my private account data
  As any site user
  I want to be able to logout of my account when I'm done using the site

  Background:
    Given I am logged in as user "wafflematron"
    And I am on the homepage

  Scenario: User signs out successfully
    Given I click the sign out link
    Then I should be on the homepage
    And I should see that I am not signed in
