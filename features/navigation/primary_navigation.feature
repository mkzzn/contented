Feature: Primary Navigation
  In order to navigate the site
  As a site user
  I want to be able to navigate to important pages from the homepage

  Scenario: User visits the homepage
    Given I am on the articles overview page
    When I click the "Home" link
    Then I should still be on the homepage

  Scenario: User visits the articles overview
    Given I am on the homepage
    When I click the "Articles" link
    Then I should be on the articles overview page

  Scenario: User visits the categories overview
    Given I am on the homepage
    When I click the "Categories" link
    Then I should be on the categories overview page

  Scenario: User is able to create a new article
    Given I am logged in as a confirmed admin user
    When I go to the homepage
    And I click the link to create a new article
    Then I should be on the new article page

  Scenario: User is not allowed to create a new article
    Given I am logged in as a confirmed reader user
    When I go to the homepage
    Then I should not see a link to create a new article
    And when I type the URL for the new articles page in the browser
    Then I should be redirected to the homepage
    And I should see a warning saying that I cannot view that page

  Scenario: User is able to create a new category
    Given I am logged in as a confirmed admin user
    When I go to the home page
    And I click the link to create a new category
    Then I should be on the new category page

  Scenario: User is not allowed to create a new category
    Given I am logged in as a confirmed reader user
    When I go to the homepage
    Then I should not see a link to create a new category
    And when I type the URL for the new categories page in the browser
    Then I should be redirected to the homepage
    And I should see a warning saying that I cannot view that page
