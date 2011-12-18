Feature: Writers Page
  In order to see who contributes to Fugue Detroit
  As a site Reader
  I want to be able to learn more about the writers

  Background:
    Given writer user "Jeff Carlson" has 3 articles
    Given writer user "Ben Hermanson" has 2 articles

  Scenario: Reader sees site writers
    When I go to the Writers page
    Then I should see "Jeff Carlson" and "Ben Hermanson"

  Scenario: Reader doesn't see non-writer users
    Given user "Steve Bates" doesn't have any articles
    When I go to the writers page
    Then I shouldn't see user "Steve Bates"
    But I should see user "Jeff Carlson"

  Scenario: Writers are sorted by article count
    When I go to the writers page
    Then I should see "Jeff Carlson" before "Ben Hermanson"

  Scenario: Reader sees writer bio
    Given user "Jeff Carlson" has a bio
    When I go to the writers page
    Then I should see the bio for user "Jeff Carlson"

  Scenario: Reader views all writer articles
    Given I go to the writers page
    And I click on "Jeff Carlson"
    Then I should be viewing the user page for "Jeff Carlson"
