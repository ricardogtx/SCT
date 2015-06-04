Feature: Cannabis page
  In order to view information in the cannabis
  As a user
  I want to access the cannabis information page

  Scenario: access cannabis information page
	Given I visit the drugs page
	When I press the 'Saiba mais' button in cannabis
	Then I am redirected to the cannabis page