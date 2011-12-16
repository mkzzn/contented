@wip
@no-txn
@sphinx
Feature: Search Articles
  In order to find specific articles
  As a site user
  I want to be able to seach by keywords

  Background:
    Given published article "goatflen"
    And unpublished article "pancakor" with body "goatflen"
    When I am on the homepage

  Scenario: Visitor searches for article
    Given I am not logged in
    When I search for keyword "goatflen"
    Then I should be on the search results page
    Then show me the page
    And I should see article "goatflen"
    But I should not see article "pancakor"

  Scenario: Reader user searches articles
    Given I am logged in as a confirmed reader user
    When I search for keyword "goatflen"
    Then I should be on the search results page
    Then show me the page
    And I should see article "goatflen"
    But I should not see article "pancakor"

  Scenario: Author user searches articles
    Given I am logged in as a confirmed admin user
    When I search for keyword "goatflen"
    Then I should be on the search results page
    And I should see article "goatflen"
    And I should see article "pancakor"

  # Scenario: User sees paginated search results

  Scenario: User sees total number of search results
    Given I am logged in as a confirmed admin user
    When I search for keyword "goatflen"
    Then I should be on the search results page
    And I should see a message saying there are two results for keyword "goatflen"

  Scenario: User sees "no results found" message
    Given I search for keyword "babble babble humon"
    Then I should be on the search results page
    And I should see a message saying there were no search results
  
  Scenario: Search should return weighted results
