Feature: Article Categories
  In order to better organize articles
  As a site editor
  I want to be able save my articles within categories

  Background:
    Given article "humon"
    And category "douglas"
    And category "macarthur"
    Given I am editing article "humon"

  Scenario: User sees article categories
    Then these article categories should be available:
      | category      |
      | douglas       |
      | macarthur     |
      | Uncategorized |
  
  Scenario: User saves an article to a category
    Given I select category "macarthur"
    And I submit the changes
    Then I should see a notice saying that article "humon" was saved to category "macarthur"
    And article "humon" should belong to category "macarthur"

  Scenario: User saves an uncategorized article
    Given I select category "Uncategorized"
    And I submit the changes
    Then I should see a notice saying that article "humon" was saved to category "Uncategorized"
    And article "humon" should be uncategorized
