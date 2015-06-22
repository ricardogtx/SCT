Feature: Edit quiz
  In order to edit a question of quiz
  As admin 
  I want to edit a question

  Scenario: To edit a question 
		Given I visit the questions page
		When I go to "/questions/1/edit"
		And I fill the text field
		And I press the button 'Enviar'
		And I press 'Cancelar'
		Then it should display the message 'Questão atualizada.'
		