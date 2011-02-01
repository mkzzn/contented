Feature: Categories Index
  In order to easily navigate through articles by subject matter
  As a site reader
  I want to be able to see all of the categories at once

  Background:
    Given category "monster" with article "weasel"
    And I am viewing the homepage
    
  Scenario: User views all categories
    Given I click to visit the Categories index
    Then I should see category "monster"
    And I should see article "weasel" within category "monster"

  Scenario: User visits article
    Given I click to visit the Categories index
    When I click the link for article "weasel"
    Then I should be viewing the article entitled "weasel"

  Scenario: User sees the first three articles for each category
    Given article "rooster" is the third article in category "monster"
    And article "douglas" is the fourth article in category "monster"
    When I click to visit the Categories index
    Then I should see article "rooster" within category "monster"
    But I should not see article "douglas" within category "monster"
