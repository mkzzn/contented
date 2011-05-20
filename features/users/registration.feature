@wip
Feature: User Registration
  In order to better participate in the site
  As a site reader
  I want to be able to register a new user account

  Background:
    Given I am on the user registration page

  Scenario: User registers successfully
    Given I enter all valid data for new user "goliath" with password "malcolm"
    When I submit the registration form
    Then I should be on the new confirmation page
    And there should be a user called "goliath"

  Scenario: User registration fails
    Given I fail to enter all valid data for user registration
    When I submit the registration form
    Then I should be on the users page
    And there should not be a user called "goliath"
