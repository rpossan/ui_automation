Feature: Casts Basics
  Sign up creation

  Scenario: Create new user
    Given I navigate to "http://localhost:3000"
    And I click on "Inscrever-se"
    And I go to the Register Page
    And I fill field Nome with value "test"
    And I fill field "Email" with random value "test@example.com"
    And I fill field "Senha" with value "Test@123456"
    And I fill field "Confirmacao de Senha" with value "Test@123456"
    And I fill field "Nome*" with random value "Ronaldo"
    And I fill field "Sobrenome" with random value "Possan"
    And I submit form
    Then I got registration successfully
    

