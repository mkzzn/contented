Feature: Edit Article
  In order to easily make changes to an article
  As a writer
  I want to be able to update the information of an existing article

  Background:
    Given article "jenkins" with body "wolfpack"

    Scenario: Admin user successfully updates article information
      Given I am logged in as a confirmed admin user
      And I visit the edit page for article "jenkins"
      And I fill in article "title" with "snakebot"
      And I fill in article "body" with "humon"
      When I submit the changes
      Then I should be viewing article "snakebot"
      And article "snakebot" should have body "humon"

    Scenario: Admin user submits invalid data
      Given I am logged in as a confirmed admin user
      And I visit the edit page for article "jenkins"
      When I clear the article title
      And I submit the changes
      Then I should be shown that the title has an error

    Scenario: Admin user cancels editing
      Given I am logged in as a confirmed admin user
      And I visit the edit page for article "jenkins"
      When I cancel editing
      Then I should be viewing article "jenkins"

    Scenario: Reader user cannot edit the article
      Given I am logged in as a confirmed reader user
      When I visit the edit page for article "jenkins"
      Then I should be redirected to the homepage
      And I should see a warning saying that I cannot view that page

    Scenario: Visitor cannot edit the article
      Given I am not logged in
      When I visit the edit page for article "jenkins"
      Then I should be redirected to the homepage
      And I should see a warning saying that I cannot view that page

    Scenario: User attaches a file
      Given I am logged in as a confirmed admin user
      And I visit the edit page for article "jenkins"
      When I click to add a new attachment
      And I select a file to upload
      And I submit the changes
      Then I should be viewing article "jenkins"
      When I visit the edit page for article "jenkins"
      Then I should see a thumbnail of the asset that I uploaded

    Scenario: User destroys an attached file
      Given I am logged in as a confirmed admin user
      And article "jenkins" has an attached asset
      When I visit the edit page for article "jenkins"
      And I check the box to destroy the asset
      And I submit the changes
      When I visit the edit page for article "jenkins"
      Then I should not see a thumbnail of the asset that I uploaded

    Scenario: User sees links to all image sizes
      Given I am logged in as a confirmed admin user
      And article "jenkins" has an attached asset
      When I visit the edit page for article "jenkins"
      Then I should see small, medium and large links for the asset
