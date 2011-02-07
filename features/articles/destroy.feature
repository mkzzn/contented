Feature: Destroy Article
  In order to get rid of articles that I don't need
  As a writer
  I want to be able to destroy articles

  Scenario: User destroys an article
    Given an article entitled "hogwash"
    When I view article "hogwash"
    And I click delete
    Then I should be on the articles index page
    And I should see a notice seeing that "hogwash" was deleted
    And article "hogwash" should not exist
    
