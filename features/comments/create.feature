Feature: Comment Creation                                                                                  
  In order to be able to give feedback on an article I've read
  As a site reader
  I want to be able to post a comment to an article

  Background:
    Given article "bonobo"
    And I am viewing article "bonobo"

  Scenario: User posts a valid comment
    Given I enter the comment "This is great!"
    And I submit the comment
    Then the comment "This is great!" should appear on the page

  Scenario: User posts an empty comment
    Given I enter an empty comment
    And I submit the comment
    Then I should see errors on the comment field
    And the comment should not be posted to the page
