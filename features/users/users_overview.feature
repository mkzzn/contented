Feature: View Users
  In order to maintain the application's user base
  As a system administrator
  I want to be able to see all users in the system

  Scenario: Admin user successfully views users
    Given confirmed admin user "waldorf@salad.biz" with password "cambodia"
    When I sign in as user "waldorf@salad.biz" with password "cambodia"
    And I visit the users overview page
    Then I should be on the users overview page
    
  Scenario: Non-admin cannot view users
    Given confirmed reader user "bezzle@marbles.biz" with password "ocelot"
    When I sign in as user "bezzle@marbles.biz" with password "ocelot"    
    And I visit the users overview page
    Then I should be on the homepage
    And I should see a warning saying that I cannot access that page

  Scenario: Admin sees all users in the system
    Given I login as a confirmed admin user
    And there are three users in the system
    When I visit the users overview page
    Then show me the page
    Then I should see three users on the page

  Scenario: Admin edits a specific user
    Given confirmed reader user "bezzle@marbles.biz"
    When I login as a confirmed admin user with email "wafflepox@magnus.biz"
    And I visit the users overview page
    Then I should see an edit link for user "beezle@marbles.biz"
    And when I click that link
    Then I should be on the edit user page for "beezle@marbles.biz"
    
