Feature: User Login
  In order to keep track of my interactions with the site
  As any user of the site
  I want to be able to login with a username and password

  Background:
    Given user "snakeberry" with password "multipass"
    And I am on the user login page

  Scenario: User logs in with valid credentials
    Given I try to login as "snakeberry" with password "multipass"
    Then I should be on the homepage
    And I should see that I am logged in as user "snakeberry"

  Scenario: User logs in with invalid credentials
    Given I try to login as "wafflehorse" with password "mutantlarvae"
    Then I should be on the user login page
    And I should see that I am not logged in
