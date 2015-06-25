Feature: search clinic
In order to find specific clinics
As a user
I want to use the filter in the clinics list

Scenario: search clinic by name
	Given I have more than one registered clinic
	And I have accessed the clinic page
	When I fill in a string in the name filter
	And I press the Buscar button
	Then the list shows only the clinics that contains that string in the name

Scenario: search clinic by estate
	Given I have more than one registered clinic
	And I have accessed the clinic page
	When I select a specific estate
	And I press the Buscar button
	Then the list shows only the clinics that belongs to that specific estate

Scenario: search clinic by modality
	Given I have more than one registered clinic
	And I have accessed the clinic page
	When I fill in a string in the modality filter
	And I press the Buscar button
	Then the list shows only the clinics that contains that string in the modality 