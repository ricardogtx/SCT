Feature: Nicotine page
  In order to view information in the nicotine
  As a user
  I want to access the nicotine information page

  Scenario: access nicotine information page
	Given I visit the drugs page
	When I press the 'Saiba mais' button in nicotine
	Then I am redirected to the nicotine page