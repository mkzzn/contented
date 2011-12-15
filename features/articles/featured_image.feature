Feature: Featured Image
  As a site author
  In order to add more visual appeal to my articles
  I want to be able to select a featured image to appear on the homepage

  Background:
    Given article "jenkins" has an attachment

  Scenario: Author selects a featured image
    Given I am logged in as a confirmed admin user
    And I visit the edit page for article "jenkins"
    And I select the featured image
    When I submit the changes
    Then I should be viewing article "jenkins"
    And article "jenkins" should have a featured image

  Scenario: User views featured image on homepage
    Given the attachment for article "jenkins" is selected as a featured image
    When I go to the homepage
    Then article "jenkins" should have a featured image

  Scenario: Author removes a featured image
    Given I am logged in as a confirmed admin user
    And I visit the edit page for article "jenkins"
    And I select no featured image
    When I submit the changes
    Then I should be viewing article "jenkins"
    And article "jenkins" should not have a featured image
