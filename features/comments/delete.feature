Feature: Comment Deletion
  In order to be get rid of heinous comments (or spam)
  As a site administrator
  I want to be able to delete articles

  Background:
    Given an article entitled "bonobo"
    And article "bonobo" has comment "mucus!"
    When I am viewing article "bonobo"

  Scenario: User deletes an article
    Then the comment "mucus!" should appear on the page
    When I click the delete link for comment "mucus!"
    Then I should see a notice saying "mucus! has been deleted"
    And I should be viewing article "bonobo"
    And I should not see the comment "mucus!"
