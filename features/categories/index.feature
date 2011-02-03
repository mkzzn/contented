Feature: Categories Index
  In order to easily navigate through articles by subject matter
  As a site reader
  I want to be able to see all of the categories at once

  Background:
    Given category "monster" with description "bar"
    And category "monster" has an article entitled "weasel"
    
  Scenario: User views all categories
    Given I visit the Categories index
    Then I should see category "monster"
    And I should see article "weasel" within category "monster"

  Scenario: User visits article
    Given I visit the Categories index
    Then show me the page
    When I click the link for article "weasel"
    Then I should be viewing the article entitled "weasel"

  Scenario: User sees the first three articles for each category
    Given article "rooster" is the third article in category "monster"
    And article "douglas" is the fourth article in category "monster"
    When I go to the categories index
    Then I should see article "rooster" within category "monster"
    But I should not see article "douglas" within category "monster"

  Scenario: User navigates to categories index from homepage
    Given I am viewing the homepage
    And I click the Categories navigation heading
    Then I should be viewing the Categories index
