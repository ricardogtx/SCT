Feature: Amphetamines page
  In order to view information in the amphetamines
  As a user
  I want to access the amphetamines information page

  Scenario: access amphetamines information page
	Given I visit the drugs page
	When I press the 'Saiba mais' button in amphetamines
	Then I am redirected to the ampheamines page