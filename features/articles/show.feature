Feature: View Article
  In order to examine an article in greater depth
  As a reader
  I want to be able to view the entirety of an article
  
  Background:
    Given I have an article entitled "articlaus"
    Given I am on the articles page
   
  Scenario: User successfully views an article
    When I click on the title for "articlaus"
    Then I should be viewing the article "articlaus"
