Feature: User Registration
  In order to better participate in the site
  As a site reader
  I want to be able to register a new user account

  Background:
    Given I am on the user registration page

  Scenario: User registers successfully
    Given I enter all valid data for new user "goliath" with password "malcolm"
    When I submit the registration form
    Then I should be on the user confirmation page

  Scenario: User registration fails
    Given I fail to enter all valid data for user registration
    When I submit the registration form
    Then I should be on the user registration page
    And I should not be logged in
