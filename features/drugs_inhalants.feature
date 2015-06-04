Feature: Inhalants page
  In order to view information in the inhalants
  As a user
  I want to access the inhalants information page

  Scenario: access inhalants information page
	Given I visit the drugs page
	When I press the 'Saiba mais' button in inhalants
	Then I am redirected to the inhalants page