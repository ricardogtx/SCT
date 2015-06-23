Feature: Answer questions quiz
  In order to answer the questions of quiz
  As user
  I want to answer the questions of quiz

  Scenario: Answers for negative
		Given I visit the first question page
		When I press the button 'Enviar'
		And I press the button 'Enviar'
		And I press the button 'Enviar'
		And I press the button 'Enviar'
		And I press the button 'Enviar'
		And I press the button 'Enviar'
		And I press the button 'Enviar'
		And I press the button 'Enviar'
		And I press the button 'Enviar'
		And I press the button 'Enviar'
		Then it should display the message 'Pontuação total: 0 de 10'
  Scenario: Answers for positive
		Given I visit the first question page
		When I press 'SIM'
		And I press the button 'Enviar'
		And I press 'SIM'
	    And I press the button 'Enviar'
		And I press 'SIM'
		And I press the button 'Enviar'
		And I press 'SIM'
		And I press the button 'Enviar'
		And I press 'SIM'
		And I press the button 'Enviar'
		And I press 'SIM'
		And I press the button 'Enviar'
		And I press 'SIM'
		And I press the button 'Enviar'
		And I press 'SIM'
		And I press the button 'Enviar'
		And I press 'SIM'
		And I press the button 'Enviar'
		And I press 'SIM'
		Then it should display the message 'Pontuação total: 10 de 10'