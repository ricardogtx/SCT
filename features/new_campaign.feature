Feature: create new campaign
	As an admin
	I want to create a new campaign
	In order to keep the application always up to date

	Scenario: Campaign new
		Given I have accessed the home page
		When I click on the 'NOVA CAMPANHA' button
		Then I see 'campaigns/new'

	Scenario: Create new campaign
		Given I have accessed the campaign/new page
		When I fill the new campaign form
		And click on the 'Enviar' button 
		Then should create a campaign