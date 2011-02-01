Feature: Category Creation
  In order to better organize articles
  As a site maintainer
  I want to be able to create categories

  Background:
    Given I go to the new category page
    
  Scenario: User successfully creates a category
    Given I enter valid data for new category "beckwith"
    When I submit the category
    Then I should be on the category index page
    And I should see category "beckwith"
    And I should see a notice saying "beckwith was created"

  Scenario: User submits an invalid category
    Given I enter an empty category title
    When I submit the category
    Then I should not be on the category index page
    And I should see a warning saying "category was not created"
    And I should errors on the category title
