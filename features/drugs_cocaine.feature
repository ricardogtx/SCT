Feature: Cocaine page
  In order to view information in the cocaine
  As a user
  I want to access the cocaine information page

  Scenario: access cocaine information page
	Given I visit the drugs page
	When I press the 'Saiba mais' button in cocaine
	Then I am redirected to the cocaine page