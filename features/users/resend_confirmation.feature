Feature: Resend Confirmation
  In order to be able to confirm an already-created user account
  As a user who hasn't doesn't have a confirmation number for whatever reason
  I want to be able to request that my confirmation be re-sent to me
 
  Background:
    Given an unconfirmed user with email "waffles@bounty.com" and confirmation token "aabbcc" 
    When I go to the resend confirmation page

  Scenario: User successfully requests confirmation resend
    Given I enter email address "waffles@bounty.com"
    When I submit the form
    Then I should be notified that my confirmation was successfully resent
    And I should receive an email containing confirmation token "aabbcc"
    And the email should have a link to auto-confirm the user

  Scenario: User enters invalid email
    Given I enter email address "donkey@pottamus.laird" and submit the form
    Then I should be warned that the email doesn't exist
    And I should not receive an email
