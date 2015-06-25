Feature: drugs information page
  In order to view information of a specific drug
  As a user
  I want to access the specific drug information page

  Scenario: access a drug information page
		Given I have a drug in the database
		And I visit the drugs page
		When I press the "Saiba mais!" button of any given drug
		Then I am redirected to that drug information page