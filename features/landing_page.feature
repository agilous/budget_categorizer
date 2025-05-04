Feature: Landing Page

  Scenario: User can see the landing page
    Given I am unauthenticated
    When I visit the landing page
    Then I am welcomed with a friendly message
