Feature: Perform testimony
  In order to perform testimony 
  As a user
  I want to be able to create testimony
  
  Scenario: Creating a new testimony

  	Given I visit the home page
  	And click in tab "DEPOIMENTOS" in nav bar
  	And I press the button Novo
	When I fill the new testimony form
	And click on the 'Enviar' button 
	Then should create a testimony