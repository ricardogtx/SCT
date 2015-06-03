Feature: User registration
  In order to register
  As a user
  I want to be able to register me
  
  Scenario: Creating a new user 

  	Given I visit the new user page
	When I fill the new user form

	And click on the 'Enviar' button 
	Then I should me register 
