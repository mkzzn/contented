Feature: Category Creation
  In order to better organize articles
  As a site maintainer
  I want to be able to create categories

  Background:
    
  Scenario: Admin user successfully creates a category
    Given I am logged in as a confirmed admin user
    When I go to the new category page
    And I enter valid data for new category "beckwith"
    When I submit the category
    Then I should be on the categories index page
    And I should see category "beckwith"
    And I should see a notice saying "Category was successfully created."

  Scenario: Admin user submits an invalid category
    Given I am logged in as a confirmed admin user
    When I go to the new category page
    And I enter an empty category title
    When I submit the category
    Then I should see a warning saying "Category was not created."
    And I should see errors on the category title

  Scenario: Reader user cannot view the new category page
    Given I am logged in as a confirmed reader user
    When I go to the new category page
    Then I should be redirected to the homepage
    And I should see a warning saying that I cannot view that page

  Scenario: Visitor cannot view the new category page
    Given I am not logged in
    When I go to the new category page
    Then I should be redirected to the homepage
    And I should see a warning saying that I cannot view that page
