Feature: Comment Creation                                                                                  
  In order to be able to give feedback on an article I've read
  As a site reader
  I want to be able to post a comment to an article

  Background:
    Given article "bonobo"

  Scenario: Admin user posts a valid comment
    Given I am logged in as a confirmed admin user
    And I am viewing article "bonobo"
    Then I should be able to successfully post comment "excellent!"

  Scenario: Reader user posts a valid comment
    Given I am logged in as a confirmed reader user
    And I am viewing article "bonobo"
    Then I should be able to successfully post comment "excellent!"

  Scenario: Admin user posts an empty comment
    Given I am logged in as a confirmed reader user
    And I am viewing article "bonobo"
    Then I should be shown an error if I post an empty comment

  Scenario: Visitor cannot post a comment
    Given I am not logged in
    And I am viewing article "bonobo"
    Then show me the page
    Then I should not see the form for posting a comment
