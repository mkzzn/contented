@wip
Feature: User Sign-Out
  In order to prevent others from changing my private account data
  As any site user
  I want to be able to logout of my account when I'm done using the site

  Background:
    Given I am logged in as user "wafflematron"
    And I am on the site homepage

  Scenario: User signs out successfully
    Given I click the link to log out user "wafflematron"
    Then I should be on the site homepage
    And I should see that that I am not logged in as user "wafflematron"
    And I should see the link to log in
