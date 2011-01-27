Feature: View Article
  In order to examine an article in greater depth
  As a reader
  I want to be able to view the entirety of an article
  
  Background:
    Given an article entitled "articlaus"
   
  Scenario: User successfully views an article
    Given I am on the articles page
    When I click on the title for "articlaus"
    Then I should be viewing the article "articlaus"

  Scenario: User reloads an article
    Given I am viewing the show article page for "articlaus"
    When I click on the title for "articlaus"
    Then I should be viewing the article "articlaus"
