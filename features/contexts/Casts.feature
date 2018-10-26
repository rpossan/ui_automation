Feature: Casts Basics
  Sign up creation

  Scenario: Create new user
    Given I navigate to "http://localhost:3000"
    And I click on "Inscrever-se"
    And I fill field "Email" with random value "test@example.com"
    #And I fill field "Password" with random value "Test@123456"
