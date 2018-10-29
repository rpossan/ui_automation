Feature: Casts Basics
  Sign up creation

  Scenario: Create new user
    Given I navigate to "http://localhost:3000"
    And I click on "Inscrever-se"
    And I fill field "Email" with random value "test@example.com"
    And I fill field "Senha" with random value "Test@123456"
    And I fill field "Confirmação de Senha" with value "Test@123456"
    And I fill field "Nome" with random value "Nome"
    And I fill field "Sobrenome" with random value "Sobrenome"
