Feature: Tranquilizer page
  In order to view information in the tranquilizer
  As a user
  I want to access the tranquilizer information page

  Scenario: access tranquilizer information page
	Given I visit the drugs page
	When I press the 'Saiba mais' button in tranquilizer
	Then I am redirected to the tranquilizer page