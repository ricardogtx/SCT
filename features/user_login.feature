Feature: User Login
In order to access some specific contents
As a user
I want to login in with my account

Scenario: login with wrong email
	Given I have accessed the login page
	And I already have an account
	When I try to login with a wrong email
	Then I am redirected to the login page

Scenario: login with wrong password
	Given I have accessed the login page
	And I already have an account
	When I try to login with a wrong password
	Then I am redirected to the login page

Scenario: login with right email and password, but without associated clinic
	Given I have accessed the login page
	And I already have an account
	When I enter my email and password correctly, but don't have an associated clinic
	Then I am redirected to the login page

Scenario: login with right email and password, and having an associated clinic
	Given I have accessed the login page
	And I already have an account
	When I enter my email and password correctly, and have an associated clinic
	Then I am logged in the site

