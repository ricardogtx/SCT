Feature: create question
  In order to update the quiz
  As an admin
  I want to add a question to the quiz

  Scenario: To add a question 
		Given I visit the questions page
		When I press the link "Nova Questão"
		And I fill the text field
		And I press the button 'Enviar'
		Then it should display the message 'Criado com sucesso!'