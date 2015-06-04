Feature: Narcotics page
  In order to view information in the narcotics
  As a user
  I want to access the narcotics information page

  Scenario: access narcotics information page
	Given I visit the drugs page
	When I press the 'Saiba mais' button in narcotics
	Then I am redirected to the narcotics page