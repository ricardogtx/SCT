Feature: Caffeine page
  In order to view information in the caffeine
  As a user
  I want to access the caffeine information page

  Scenario: access caffeine information page
	Given I visit the drugs page
	When I press the 'Saiba mais' button in caffeine
	Then I am redirected to the caffeine page