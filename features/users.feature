Feature: user registration
  In order to have a registered account in the site
  As a user
  I want to be able to register myself
  
  Scenario: Create a new user 
  	Given I visit the new user page
		When I fill the new user form
		And click on the 'Enviar' button 
		Then I should be registered
