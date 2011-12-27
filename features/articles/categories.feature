Feature: Article Categories
  In order to better organize articles
  As a site editor
  I want to be able save my articles within categories

  Background:
    Given I am logged in as a confirmed admin user
    And article "humon"
    And categories "douglas" and "macarthur"
    When I am editing article "humon"

  Scenario: User sees article categories
    Then these article categories should be available:
      | category      |
      | douglas       |
      | macarthur     |
      | Uncategorized |
  
  Scenario: User saves an article to a category
    Given I select category "macarthur"
    Then show me the page
    And I submit the article
    Then I should see a notice saying that article "humon" was saved to category "macarthur"
    And article "humon" should belong to category "macarthur"

  Scenario: User saves an uncategorized article
    Given I select category "Uncategorized"
    Then show me the page
    And I submit the article
    Then I should see a notice saying that article "humon" was saved to category "Uncategorized"
    And article "humon" should not be categorized
