Feature: Drugs page
  In order to view information in the specific drug
  As a user
  I want to access the specific drug information page

  Scenario: access alcohol information page
	Given I visit the drugs page
	When I press the Saiba mais button in alcool
	Then I am redirected to the Alcohol Saiba Mais page

  Scenario: access amphetamines information page
	Given I visit the drugs page
	When I press the 'Saiba mais' button in amphetamines
	Then I am redirected to the ampheamines page

  Scenario: access antidepressants information page
	Given I visit the drugs page
	When I press the 'Saiba mais' button in antidepressants
	Then I am redirected to the antidepressants page

  Scenario: access barbiturates information page
	Given I visit the drugs page
	When I press the Saiba mais button in barbiturates
	Then I am redirected to the barbiturates page	

  Scenario: access caffeine information page
	Given I visit the drugs page
	When I press the 'Saiba mais' button in caffeine
	Then I am redirected to the caffeine page	

  Scenario: access cannabis information page
	Given I visit the drugs page
	When I press the 'Saiba mais' button in cannabis
	Then I am redirected to the cannabis page

  Scenario: access cocaine information page
	Given I visit the drugs page
	When I press the 'Saiba mais' button in cocaine
	Then I am redirected to the cocaine page	
	
  Scenario: access inhalants information page
	Given I visit the drugs page
	When I press the 'Saiba mais' button in inhalants
	Then I am redirected to the inhalants page

  Scenario: access narcotics information page
	Given I visit the drugs page
	When I press the 'Saiba mais' button in narcotics
	Then I am redirected to the narcotics page

  Scenario: access nicotine information page
	Given I visit the drugs page
	When I press the 'Saiba mais' button in nicotine
	Then I am redirected to the nicotine page

  Scenario: access tranquilizer information page
	Given I visit the drugs page
	When I press the 'Saiba mais' button in tranquilizer
	Then I am redirected to the tranquilizer page			


