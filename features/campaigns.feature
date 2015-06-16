Feature: access campaign index
	As a visitor
	I want to have access to all campaigns
	In order to easily find some specific information

	Scenario: Campaign index
		Given I have accessed the home page
		When I click on the 'VISUALIZAR CAMPANHAS' button
		Then I see 'campaigns'