Feature: Show Category
  In order to better navigate through articles
  As a site reader
  I want to be able to see all of the articles in a given category

  Background:
    Given category "foo"
    And category "foo" has article "bar"
    And category "foo" has article "baz"

  Scenario: User navigates to the category page
    Given I am on the categories index
    When I click the title of category "foo"
    Then I should be viewing category "foo"

  Scenario: User sees all articles in the category
    When I visit the show page for category "foo"
    Then I should see article "bar" within category "foo"
    And I should see article "baz" within category "foo"
