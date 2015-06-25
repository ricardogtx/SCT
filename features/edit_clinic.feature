Feature: edit informations clinic
  In order to keep my clinic's informations up to date
  As a user
  I want to edit my clinic's informations

  Scenario: edit clinic's informations
  	Given I have accessed the login page
		And I already have an account
		When I enter my email and password correctly, and have an associated clinic
		And I press the 'Editar Clínica' button 
		And I edit information in the form
		Then I am redirected to the users page