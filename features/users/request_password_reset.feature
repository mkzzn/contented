@wip
Feature: Request Password Reset Instructions
  In order to set a new password for user account
  As a user whose password is forgotten
  I want to be able to request instructions to reset my password

  Background:
    Given user "bottlehead" with email address "lame@waffle.net"
    When I go to the request password reset page

  Scenario: User requests password reset instructions
    Given I enter email address "lame@waffle.net" and submit the form
    Then I should be notified that password reset instructions were sent to me
    And I should receive and email with a link to reset my password

  Scenario: User enters an nonexistent email address
    Given no user exists with email address "donkey@larvae.us"
    When I enter email address "donkey@larvae.us" and submit the form
    Then I should be warned that no user with that email address exists
