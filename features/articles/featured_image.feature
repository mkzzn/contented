Feature: Featured Image
  As a site author
  In order to add more visual appeal to my articles
  I want to be able to select a featured image to appear on the homepage

  Background:
    Given article "jenkins" with attachment "walrusoar.jpg"

  Scenario: Select a featured image
    Given I am logged in as a confirmed admin user
    And I visit the edit page for article "jenkins"
    And I select "walrusoar.jpg" as the featured image
    When I submit the changes
    Then I should be viewing article "snakebot"
    And article "snakebot" should have featured image "walrusoar.jpg"

  Scenario: Featured image on homepage
    When I go to the homepage
    Then article "snakebot" should have featured image "walrusoar.jpg"

  Scenario: Remove a featured image
    Given I am logged in as a confirmed admin user
    And I visit the edit page for article "jenkins"
    And I select no featured image
    When I submit the changes
    Then I should be viewing article "snakebot"
    And article "snakebot" should not have a featured image
