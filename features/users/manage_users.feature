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
    And the email field should say "monkey@jones.net"

  Scenario: Admin changes user role
    Given I change the user role to "admin"
    When I submit the changes
    Then I should be on the users overview page
    And I should see a notice saying that the user was updated
    And the user "monkey@jones.net" should be an admin
