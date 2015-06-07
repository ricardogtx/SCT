Feature: Edit informations clinic
  In order to edit informations in the clinic
  As a user
  I want to change informations clinic

  Scenario: To change information clinic
  	Given I have accessed the login page
	And I already have an account
	When I enter my email and password correctly
	And I press the 'Editar Clínica' button 
	And I edit information in the form
	Then I am redirected to the users page