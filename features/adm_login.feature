Feature: Adm Login
In order to access some specific contents
As an adm
I want to login in with my account

Scenario: login with right email and password, using an adm account
	Given I have an admin account
	And I have accessed the login page
	And I already have an account
	When I enter my email and password correctly, using an adm account
	Then I am logged in the site

