Feature: Users Overview
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
    Given there are three users in the system
    When I login as a confirmed admin user and visit the users overview page
    Then I should see three users on the page
