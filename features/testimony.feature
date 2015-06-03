Feature: Perform testimony
  In order to perform testimony 
  As a user
  I want to be able to create testimony
  
  Scenario: Creating a new testimony

  	Given I visit the new testimony page
  	And click in "aqui"
	When I fill the new testimony form
	And click on the 'Enviar' button 
	Then should create a testimony