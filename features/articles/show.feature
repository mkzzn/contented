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
    And I am viewing article "articlaus"
    Then I should see category "fluevog" within article "articlaus"

  Scenario: User sees uncategorized article categorization
    Given article "articlaus" is uncategorized
    And I am viewing article "articlaus"
    Then article "articlaus" should show that it is uncategorized

  Scenario: User visits article category
    Given article "articlaus" is within category "fluevog"
    And I am viewing article "articlaus"
    When I click the link to category "fluevog" within article "articlaus"
    Then I should be viewing category "fluevog"

  Scenario: User clicks uncategorized article link
    Given article "articlaus" is uncategorized
    And I am viewing article "articlaus"
    When I click the uncategorized link within article "articlaus"
    Then I should be on the uncategorized articles page

  Scenario: User sees HTML-formatted body
    Given article "articlaus" has body "##Wafflebots"
    When I am viewing article "articlaus"
    Then show me the page
    Then the article body should contain "<h2>Wafflebots</h2>"

  Scenario: Admin sees edit article link
    Given I am logged in as a confirmed admin user
    And I am viewing article "articlaus"
    Then I should see the link to edit the article
    
  Scenario: User cannot see edit article link
    Given I am logged in as a confirmed reader user
    And I am viewing article "articlaus"
    Then I should not see the link to edit the article

  Scenario: Visitor cannot see edit article link
    Given I am viewing article "articlaus"
    Then I should not see the link to edit the article
