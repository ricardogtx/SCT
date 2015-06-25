Feature: edit quiz
  In order to keep the quiz up to date
  As an admin 
  I want to edit a question from the quiz

  Scenario: edit a question 
		Given I visit the questions page
		When I go to "/questions/1/edit"
		And I fill the text field
		And I press the button 'Enviar'
		And I press 'Cancelar'
		Then it should display the message 'Questão atualizada.'
		