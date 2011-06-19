Feature: Edit Article
  In order to easily make changes to an article
  As a writer
  I want to be able to update the information of an existing article

  Background:
    Given article "jenkins"
    And I am logged in as a confirmed admin user
    And article "jenkins" has body "wolfpack"
    And I am viewing article "jenkins"
    And I click "Edit"

    Scenario: Admin user successfully updates article information
      Given I fill in article "title" with "snakebot"
      And I fill in article "body" with "humon"
      When I submit the changes
      Then I should be viewing article "snakebot"
      And article "snakebot" should have body "humon"

    Scenario: Admin user submits invalid data
      Given I clear the article title
      When I submit the changes
      And I should be shown that the title has an error

    Scenario: Admin user cancels editing
      Given I cancel editing
      Then I should be viewing article "jenkins"
