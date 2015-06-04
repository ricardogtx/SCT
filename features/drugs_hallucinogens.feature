Feature: Hallucinogen page
  In order to view information in the hallucinogens
  As a user
  I want to access the hallucinogens information page

  Scenario: access hallucinogens information page
	Given I visit the drugs page
	When I press the Saiba mais button in hallucinogens
	Then I am redirected to the hallucinoges page