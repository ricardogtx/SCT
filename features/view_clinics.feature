Feature: Clinics page
In order to view clinics page
As a user
I want to access the clinics page

Scenario: access clinics page
	Given I have accessed the home page
	When I press the button 'SAIBA MAIS!' in 'Comunidades terapêuticas'
	Then I am redirected to the clinics page