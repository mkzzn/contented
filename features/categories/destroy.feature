@todo
Feature: Destroy Categories
  In order to get rid of categories that I don't need
  As a site maintainer
  I want to be able to delete existing categories

  Background:
    Given category "walruses"
  
  Scenario: User deletes a category
    Given I am viewing category "walruses"
    When I click to delete the category
    Then I should be on the categories index
    And I should not see category "walruses"
    And category "walruses" should not exist

  Scenario: Articles are uncategorized after category deletion
    Given article "munchhausen" within category "walruses"
    When I delete category "walruses"
    Then article "munchhausen" should be uncategorized
