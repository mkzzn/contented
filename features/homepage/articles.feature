Feature: Homepage Articles
  In order to quickly view the recent articles on the site
  As a site reader
  I want to be able to see articles on the homepage

  Background:
    Given article "walruses"
    And article "grandy"

  Scenario: User sees homepage articles
    Given I am on the homepage
    Then I should see article "walruses"
    And I should see article "grandy"
