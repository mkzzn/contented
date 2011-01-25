Feature: Create Article
  In order to publish content
  As a Snakewise Writer
  I want to be able to create articles
  
  Scenario: User Successfully Creates an Article
    Given I am on the new article page
    And I enter valid data for an article entitled "goats"
    When I submit the article
    Then I should be on the articles index page
    And I should see article "goats"
    And I should see a notice saying that article "goats" was created
 
  Scenario: User Fails to create an Article
    Given I am on the new article page
    And I enter insufficient values for an article
    When I submit the article
    And I should see a warning saying that my article was not created
