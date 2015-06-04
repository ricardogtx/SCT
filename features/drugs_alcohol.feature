Feature: Alcohol page
  In order to view information in the alcohol
  As a user
  I want to access the alcohol information page

  Scenario: access alcohol information page
	Given I visit the drugs page
	When I press the Saiba mais button in alcool
	Then I am redirected to the Alcohol Saiba Mais page