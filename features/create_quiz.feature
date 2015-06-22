Feature: Create quiz
  In order to add a question of quiz
  As admin 
  I want to add a question

  Scenario: To add a question 
		Given I visit the questions page
		When I press the link "Nova Questão"
		And I fill the text field
		And I press the button 'Enviar'
		Then it should display the message 'Criado com sucesso!'