Feature: Article commenting
  In order to be able to give feedback on an article I've read
  As a site reader
  I want to be able to post a comment to an article
  
  Background:
    Given an article entitled "bonobo"
    And I am viewing article "bonobo"
  
  Scenario: User posts a valid comment
    Given I enter a valid comment
    And I submit the comment
    Then my comment should be posted to the page
    And the comment box should be empty

  Scenario: User posts an invalid comment
    Given I enter an invalid comment
    And I submit the comment
    Then I should see errors on the comment field
    And the comment should not be posted to the page
    
