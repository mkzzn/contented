Feature: Destroy Categories
  In order to get rid of categories that I don't need
  As a site maintainer
  I want to be able to delete existing categories

  Background:
    Given I am logged in as a confirmed admin user
    And article "mutumbo" within category "walruses"
    When I am viewing category "walruses"

  Scenario: User deletes a category
    Given I click to delete the category
    When I should be sent to the categories index
    Then I should not see category "walruses"
    And category "walruses" should not exist

  Scenario: Articles are uncategorized after category deletion
    Given I click to delete the category
    Then article "mutumbo" should not be categorized
