Feature: Edit testimony
  In order to edit testimony 
  As a user
  I want to be able to edit testimony
  
  Scenario: Editing a testimony

    Given I have do "testimony"
  	Given I visit the home page
  	And click in tab "DEPOIMENTOS" in nav bar
  	And I press link "Editar"
  	When I fill the new testimony form
	  And click on the 'Enviar' button 
	  Then should edit a testimony