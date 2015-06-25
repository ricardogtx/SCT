Feature: perform testimony
  In order to share my experiences 
  As a user
  I want to create a testimony
  
  Scenario: Create a new testimony
  	Given I visit the home page
  	And click in tab "DEPOIMENTOS" in nav bar
  	And I press the button Novo
  	When I fill the new testimony form
  	And click on the 'Enviar' button 
  	Then it should create a testimony