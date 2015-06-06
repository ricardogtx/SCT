Feature: User Login
In order to access some specific contents
As a user
I want to login in with my account

Scenario: login with right email and password
	Given I have accessed the login page
	And I already have an account
	When I enter my email and password correctly
	Then I am logged in the site.