Feature: Users Overview
  In order to maintain the application's user base
  As a system administrator
  I want to be able to see all users in the system

  Scenario: Admin user successfully views users
    Given I am logged in as a confirmed admin user
    And I visit the users overview page
    Then I should be on the users overview page
    
  Scenario: Reader user cannot view users
    Given I am logged in as a confirmed reader user
    And I visit the users overview page
    Then I should be on the homepage
    And I should see a warning saying that I cannot view that page

  Scenario: Visitor cannot view users
    Given I am not logged in
    When I visit the users overview page
    Then I should be on the homepage
    And I should see a warning saying that I cannot view that page

  Scenario: Admin sees all users in the system
    Given I login as a confirmed admin user
    And there are three users in the system
    When I visit the users overview page
    Then I should see three users on the page

  Scenario: Admin edits a specific user
    Given confirmed reader user "mongo@tongue.com"
    When I login as a confirmed admin user with email "wafflepox@magnus.biz"
    And I visit the users overview page
    When I click the link to edit user "mongo@tongue.com"
    Then I should be editing the user "mongo@tongue.com"
