Feature: Antidepressants page
  In order to view information in the antidepressants
  As a user
  I want to access the antidepressants information page

  Scenario: access antidepressants information page
	Given I visit the drugs page
	When I press the 'Saiba mais' button in antidepressants
	Then I am redirected to the antidepressants page