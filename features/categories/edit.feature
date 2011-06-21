Feature: Edit Category
  In order to better refine information about categories
  As a publication editor
  I want to be able to update existing categories

  Background:
    Given category "jenkins" with description "wolfpack"

    Scenario: Admin user visits the edit category page
      Given I am logged in as a confirmed admin user
      When I visit the edit page for category "jenkins"
      Then I should be on the edit page for category "jenkins"

    Scenario: User successfully updates category information
      Given I am logged in as a confirmed admin user
      And I visit the edit page for category "jenkins"
      When I enter category title "snakebot" and description "waffles"
      And I submit the changes
      Then I should be viewing the categories index page
      And I should see category "snakebot" with description "waffles"
      And I should see a notice saying "snakebot was successfully updated"
      But I should not see category "jenkins"

    Scenario: Admin user submits invalid data
      Given I am logged in as a confirmed admin user
      And I visit the edit page for category "jenkins"
      When I clear the category title
      And I submit the changes
      Then I should be shown that the category title has an error

    Scenario: Admin user cancels editing
      Given I am logged in as a confirmed admin user
      And I visit the edit page for category "jenkins"
      When I cancel editing the category
      Then I should be viewing the categories index page

    Scenario: Reader user cannot edit the article
      Given I am logged in as a confirmed reader user
      When I visit the edit page for category "jenkins"
      Then I should be redirected to the homepage
      And I should see a warning saying that I cannot view that page

    Scenario: Visitor cannot edit the article
      Given I am not logged in
      When I visit the edit page for category "jenkins"
      Then I should be redirected to the homepage
      And I should see a warning saying that I cannot view that page
