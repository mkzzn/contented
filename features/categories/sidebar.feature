Feature: Categories Sidebar
  In order to quickly jump to a category
  As a site reader
  I want to see a brief list of all categories on the homepage

  Background:
    Given category "foo"
    And category "foo" has article "bar"
    And category "foo" has 3 other articles
    
  Scenario: User sees category in sidebar
    When I go to the homepage
    Then I should see category "foo" in the sidebar
    And category "foo" should show that it has 4 articles

  Scenario: User visits category via sidebar
    When I visit the homepage
    And I click category "foo" in the sidebar
    Then I should be viewing category "foo"    
