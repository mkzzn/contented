Feature: Writers Page
  In order to see who contributes to Fugue Detroit
  As a site Reader
  I want to be able to learn more about the writers

  Background:
    Given writer user "jeff@carlson.com" has 3 articles
    Given writer user "ben@hermanson.com" has 2 articles

  Scenario: Reader sees site writers
    When I go to the Writers page
    Then I should see writers "jeff@carlson.com" and "ben@hermanson.com"

  Scenario: Reader doesn't see non-writer users
    Given user "steve@bates.com" doesn't have any articles
    When I go to the writers page
    Then I shouldn't see user "steve@bates.com"
    But I should see user "jeff@carlson.com"

  Scenario: Writers are sorted by article count
    When I go to the writers page
    Then I should see "jeff@carlson.com" before "ben@hermanson.com"

  Scenario: Reader sees writer bio
    Given user "jeff@carlson.com" has a bio
    When I go to the writers page
    Then I should see the bio for user "jeff@carlson.com"

  Scenario: Reader views all writer articles
    Given I go to the writers page
    And I click the link for writer user "jeff@carlson.com"
    Then I should be viewing the writer page for user "jeff@carlson.com"
