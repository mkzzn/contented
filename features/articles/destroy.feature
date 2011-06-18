Feature: Destroy Article
  In order to get rid of articles that I don't need
  As a writer
  I want to be able to destroy articles

  Background:
    And article "hogwash"

  Scenario: Admin user destroys an article
    Given I am logged in as a confirmed admin user
    When I view article "hogwash"
    And I click delete
    Then I should be on the articles index page
    And I should see a notice seeing that "hogwash" was deleted
    And there should be no article called "hogwash" 
    
  Scenario: Reader user cannot destroy an article
    Given I am logged in as a confirmed reader user
    When I view article "hogwash"
    Then I should not see a link to delete the article

  Scenario: Visitor cannot destroy an article
    Given I view article "hogwash"
    Then I should not see a link to delete the article
