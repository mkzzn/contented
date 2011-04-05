Feature: Password Reset
  In order to log back into my user account
  As a user who's already been emailed a reset password link
  I want to be able to define a new password for my account

  Background:
    Given I successfully requested password reset for user "bottlehead"
    When I follow the link from the password reset email
    Then I should be on the password reset page for user "bottlehead"
  
  Scenario: User successfully resets password
    Given I enter password "octopus" for both password fields
    When I submit the form
    Then I should be notified that my password was successfully changed
    And I should be viewing user "bottlehead"

  Scenario: User enters two different passwords on reset
    Given when I enter "octopus" in the password field
    And I enter "losthumon" in the confirmation field
    When I submit the form
    Then I should be warned that my passwords didn't match
    And I should be on the password reset page for user "bottlehead"
