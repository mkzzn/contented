Feature: Site Header
  In order to quickly navigate back to the homepage
  As a site reader
  I want clicking on the site logo to take me back to the homepage

  Scenario: User clicks the site logo
    Given I am on the categories index
    When I click the site branding
    Then I should be on the homepage
