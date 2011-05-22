Feature: User Registration
  In order to better participate in the site
  As a site reader
  I want to be able to register a new user account

  Background:
    Given I am on the user registration page

  Scenario: User registers successfully
    Given I enter all valid data for new user "goliath@waffleplex.com" with password "malcolm"
    When I submit the registration form
    Then I should be on the homepage
    And I should see a notice saying that my account was created
    And there should be a user called "goliath@waffleplex.com"

  Scenario: User registration fails
    Given I fail to enter all valid data for user registration
    When I submit the registration form
    Then I should be on the users page
    And I should see a warning on the page
    And there should not be a user called "goliath@waffleplex.com"
