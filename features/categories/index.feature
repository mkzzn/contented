Feature: Categories Index
  In order to easily navigate through articles by subject matter
  As a site reader
  I want to be able to see all of the categories at once

  Background:
    Given category "monster" with description "bar"
    And category "monster" contains article "weasel"
    
  Scenario: User views all categories
    Given I go to the categories index
    Then I should see category "monster"
    And I should see article "weasel" within category "monster"

  Scenario: User visits article
    Given I go to the categories index
    When I click to visit article "weasel"
    Then I should be viewing article "weasel"

  Scenario: User sees the first three articles for each category
    Given article "rooster" is the third article in category "monster"
    And article "douglas" is the fourth article in category "monster"
    When I go to the categories index
    Then I should see article "rooster" within category "monster"
    But I should not see article "douglas" within category "monster"

  Scenario: User navigates to categories index from homepage
    Given I am viewing the homepage
    And I click the categories navigation heading
    Then I should be on the categories index

  Scenario: Admin user clicks the edit category link
    Given I am logged in as a confirmed admin user
    When I go to the categories index
    And I click the link to edit category "monster"
    Then I should be on the edit page for category "monster"

  Scenario: Reader cannot see the edit category link
    Given I am logged in as a confirmed reader user
    When I go to the categories index
    Then I should not see an edit link for category "monster"

  Scenario: Visitor cannot see the edit category link
    Given I am logged in as a confirmed reader user
    When I go to the categories index
    Then I should not see an edit link for category "monster"
