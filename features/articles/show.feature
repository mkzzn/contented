Feature: View Article
  In order to examine an article in greater depth
  As a reader
  I want to be able to view the entirety of an article
  
  Background:
    Given article "articlaus"
   
  Scenario: User successfully views an article
    Given I am on the articles page
    When I click on the title for "articlaus"
    Then I should be viewing article "articlaus"

  Scenario: User reloads an article
    Given I am viewing article "articlaus"
    When I click on the title for "articlaus"
    Then I should be viewing article "articlaus"

  Scenario: User sees the article category
    Given article "articlaus" is within category "fluevog"
    Given I am viewing article "articlaus"
    Then I should see category "fluevog" within article "articlaus"

  Scenario: User sees no link for uncategorized article
    Given article "articlaus" is uncategorized
    Given I am viewing article "articlaus"
    Then article "articlaus" should show that it is uncategorized

  @todo
  Scenario: User visits article category
    Given article "articlaus" is within category "fluevog"
    And I am viewing article "articlaus"
    When I click the link to category "fluevog" within article "articlaus"
    Then I should be viewing category "fluevog"
