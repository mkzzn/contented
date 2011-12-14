Feature: Publishing
  As a site author
  In order to work on an article before publishing
  I want to be able to choose whether it's published or not

  Scenario: Author publishes a new article
    Given I am logged in as a confirmed admin user
    When I create a new, published article called "goats"
    Then I should be on the articles index page
    And I should see article "goats"
    And article "goats" should be published

  Scenario: Author creates a new article without publishing
    Given I am logged in as a confirmed admin user
    When I create a new, unpublished article called "goats"
    Then I should be on the articles index page
    And I should see article "goats"
    And article "goats" should be unpublished

  Scenario: Author publishes an existing article
    Given unpublished article "jenkins"
    And I am logged in as a confirmed admin user
    When I publish article "jenkins"
    And I go to the homepage
    Then I should see article "jenkins"
    Then show me the page
    And article "jenkins" should be published

  Scenario: Author un-publishes an existing articl
    Given published article "jenkins"
    And I am logged in as a confirmed admin user
    When I unpublish article "jenkins"
    And I go to the homepage
    Then I should see article "jenkins"
    And article "jenkins" should be unpublished
    
  Scenario: Reader cannot view an unpublished article
    Given unpublished article "jenkins"
    And I am logged in as a confirmed reader user
    When I view article "jenkins"
    Then I should be on the homepage
    And I should see a warning saying that I cannot view that page

  Scenario: Reader cannot see unpublished articles on the homepage
    Given unpublished article "jenkins"
    And I am logged in as a confirmed reader user
    When I go to the homepage
    Then I should not see article "jenkins"

  Scenario: Author views an unpublished article
    Given unpublished article "jenkins"
    And I am logged in as a confirmed admin user
    When I view article "jenkins"
    Then I should be viewing article "jenkins"
