Feature: Show Category
  In order to better navigate through articles
  As a site reader
  I want to be able to see all of the articles in a given category

  Background:
    Given category "foo" with articles "bar" and "baz"

  Scenario: User sees all articles in the category
    When I visit category "foo"
    Then I should see articles "bar" and "baz"
