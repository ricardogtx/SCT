Feature: Drugs informations page
In order to view drugs page
As a user
I want to access the drugs page.

Scenario: access drugs informations page
	Given I have accessed the home page
	When I press the button 'SAIBA MAIS!' in 'Drogas'
	Then I am redirected to the drugs page