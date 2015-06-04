Feature: Barbiturates page
  In order to view information in the barbiturates
  As a user
  I want to access the barbiturates information page

  Scenario: access barbiturates information page
	Given I visit the drugs page
	When I press the Saiba mais button in barbiturates
	Then I am redirected to the barbiturates page