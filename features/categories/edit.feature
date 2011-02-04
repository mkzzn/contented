Feature: Edit Category
  In order to better refine information about categories
  As a publication editor
  I want to be able to update existing categories

  Background:
    Given category "jenkins" with description "wolfpack"
    And I am viewing the categories index page
    When I click to edit category "jenkins"

    Scenario: User is taken to the edit category page
      Then I should be on the edit page for category "jenkins"

    Scenario: User successfully updates category information
      Given I enter category title "snakebot" and description "waffles"
      When I submit the changes
      Then I should be viewing the categories index page
      And I should see category "snakebot" with description "waffles"
      And I should see a notice saying "snakebot was successfully updated"
      But I should not see category "jenkins"

    Scenario: User submits invalid data
      Given I clear the category title
      When I submit the changes
      And I should be shown that the category title has an error

    Scenario: User cancels editing
      Given I cancel editing
      Then I should be viewing the categories index page
