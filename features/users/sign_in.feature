Feature: User Login
  In order to keep track of my interactions with the site
  As any user of the site
  I want to be able to login with a username and password

  Scenario: Confirmed User logs in with valid credentials
    Given confirmed user with email "snake@berry.net" and password "multipass"
    And I am on the user sign-in page
    When I sign in with email "snake@berry.net" and password "multipass"
    Then I should be on the homepage
    And I should see that I am signed in as user "snake@berry.net"
    And I should see a notice saying that I was signed in successfully

  Scenario: Unconfirmed User logs in with valid credentials
    Given unconfirmed user with email "dogma@berry.net" and password "multipass"
    And I am on the user sign-in page
    When I sign in with email "dogma@berry.net" and password "multipass"
    Then I should be on the user sign-in page
    And I should see that I am not signed in
    And I should see an alert saying that my account is not confirmed 

  Scenario: User logs in with invalid credentials
    Given confirmed user with email "snake@berry.net" and password "multipass"
    And I am on the user sign-in page
    When I sign in with email "wafflehorse" and password "mutantlarvae"
    Then I should be on the user sign-in page
    And I should see that I am not signed in
    And I should see an alert saying that I was not signed in
