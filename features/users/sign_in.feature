Feature: User Login
  In order to keep track of my interactions with the site
  As any user of the site
  I want to be able to login with a username and password

  Background:
    Given confirmed user with email "snake@berry.net" and password "multipass"
    And I am on the user sign-in page

  Scenario: User logs in with valid credentials
    Given I try to sign in as "snake@berry.net" with password "multipass"
    Then I should be on the homepage
    And I should see that I am signed in as user "snake@berry.net"
    And I should see a notice saying that I was signed in successfully

  Scenario: User logs in with invalid credentials
    Given I try to sign in as "wafflehorse" with password "mutantlarvae"
    Then I should be on the user sign-in page
    And I should see that I am not signed in
    # And I should see a warning saying that I was not signed in
