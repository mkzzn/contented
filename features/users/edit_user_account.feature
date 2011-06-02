Feature: Edit User Account
  In order to change my personal information
  As a site reader
  I want to be able to update my user profile

  Background:
    Given confirmed reader user "mung@bean.org" with password "multiplex" 
    When I sign in as user "mung@bean.org" with password "multiplex"
    And I visit my user account page
    
  Scenario: User successfully updates their account
    Given I fill in "Mung" for my first name
    And I enter the current password "multiplex"
    And I submit the changes
    Then I should be on the homepage
    And I should see a notice saying that the user was successfully updated

  Scenario: User tries to update account without entering current password
    Given I fill in "Mung" for my first name
    And I submit the changes
    Then I should be on the users page
    And I should see an error explanation saying that a password is required

  Scenario: User cannot change role
    Then I should not be able to change my role
