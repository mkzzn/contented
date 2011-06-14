Feature: Manage Users
  In order to change user information
  As a system administrator
  I want to be able to edit and individual user 

  Background:
    Given confirmed admin user "waldorf@salad.biz" with password "cambodia"
    And confirmed reader user "mondo@putnam.biz" with password "badges"
    When I sign in as user "waldorf@salad.biz" with password "cambodia"
    And I visit the edit page for user "mondo@putnam.biz"

  Scenario: Admin updates user without changing password
    Given I change the user email to "monkey@jones.net"
    When I submit the changes
    Then I should be on the users overview page
    And I should see a notice saying that the user was updated
    And I should see the user "monkey@jones.net" 

  Scenario: Admin changes user role
    Given I change the user role to "admin"
    When I submit the changes
    Then I should be on the users overview page
    And I should see a notice saying that the user was updated
    And I should see that the user "mondo@putnam.biz" is an admin

  Scenario: User update fails with only password field
    Given I change the password to "boggle"
    When I submit the changes
    Then I should be on the show user page for "mondo@putnam.biz"
    And I should see an error saying that the passwords do not match

  Scenario: User update fails with mismatched passwords
    Given I change the password to "boggle"
    And I change the password confirmation to "monkey"
    When I submit the changes
    Then I should be on the show user page for "mondo@putnam.biz"
    And I should see an error saying that the passwords do not match
