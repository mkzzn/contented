Feature: Asset Attachment
  As a site writer
  In order to add media to my articles
  I want to be able to upload photo attachements to my articles

  Background:
    Given article "jenkins" with body "wolfpack"

  Scenario: User attaches a file
    Given I am logged in as a confirmed admin user
    And I visit the edit page for article "jenkins"
    When I select a file to upload
    And I submit the changes
    Then I should be viewing article "jenkins"
    And article "jenkins" should have one asset
    When I visit the edit page for article "jenkins"
    Then I should see a thumbnail of the asset that I uploaded
