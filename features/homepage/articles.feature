Feature: Homepage Articles
  In order to quickly view the recent articles on the site
  As a site reader
  I want to be able to see articles on the homepage

  Background:

  Scenario: User sees homepage articles
    Given article "walruses"
    And article "grandy"
    When I am on the homepage
    Then I should see article "walruses"
    And I should see article "grandy"

  Scenario: User sees article author
    Given article "grandy" was written by "Albert Plankman"
    When I go to the homepage
    And I should see that article "grandy" was written by "Albert Plankman"
    
  Scenario: User sees article date
    Given article "grandy" was written on "2011-10-01"
    When I go to the homepage
    Then I should see that article "grandy" was created on "2011-10-01"

  Scenario: User sees number of article comments
    Given article "grandy" has 2 comments
    When I go to the homepage
    Then show me the page
    Then I should see that article "grandy" has 2 comments
    
  Scenario: User links to article comments
    Given article "grandy" has 2 comments
    When I go to the homepage
    When I click on the comments link for article "grandy"
    Then I should be viewing the comments section for article "grandy"
