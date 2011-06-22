Feature: Comment Deletion
  In order to be get rid of heinous comments (or spam)
  As a site administrator
  I want to be able to delete articles

  Background:
    Given article "bonobo" with comment "werewolf"

  Scenario: Admin user deletes a comment
    Given I am logged in as a confirmed admin user
    And I am viewing article "bonobo"
    When I click the delete link for comment "werewolf"
    Then I should see a notice saying "werewolf has been deleted"
    And I should not see the comment "werewolf"
    And I should be viewing article "bonobo"

  Scenario: Reader user deletes own comment
    Given I am logged in as confirmed reader user "hoss@weasel.net"
    And user "hoss@weasel.net" owns comment "werewolf"
    And I am viewing article "bonobo"
    When I click the delete link for comment "werewolf"
    Then I should see a notice saying "werewolf has been deleted"
    And I should not see the comment "werewolf"
    And I should be viewing article "bonobo"

  Scenario: Reader cannot delete foreign comment
    Given I am logged in as confirmed reader user "hoss@weasel.net"
    And user "hoss@weasel.net" does not own comment "werewolf"
    And I am viewing article "bonobo"
    Then I should not see the delete link for comment "werewolf"

  Scenario: Visitor cannot delete comment
    Given I am not logged in
    And I am viewing article "bonobo"
    Then I should not see the delete link for comment "werewolf"
