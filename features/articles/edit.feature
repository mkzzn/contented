Feature: Edit Article
  In order to easily make changes to an article
  As a writer
  I want to be able to update the information of an existing article

  Background:
    Given an article entitled "jenkins"
    And article "jenkins" has body "wolfpack"
    When I edit article "jenkins"

    Scenario: User successfully updates article information
      Given I change the title and body of "jenkins" to "snakebot" and "humon"
      When I submit the changes
      Then I should be viewing article "snakebot"
      And article "snakebot" should have body "humon"

    Scenario: User submits invalid data
      Given I clear the article title
      When I submit the changes
      Then I should be viewing article "jenkins"
      And I should be shown that the title has an error
