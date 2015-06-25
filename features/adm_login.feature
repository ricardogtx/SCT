Feature: adm login
In order to access some specific contents
As an admin
I want to login in with my account

Scenario: login with right email and password, using an admin account
	Given I have an admin account
	And I have accessed the login page
	When I enter my email and password correctly, using an admin account
	Then I am logged as an admin

