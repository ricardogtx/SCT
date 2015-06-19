Feature: Paginations clinics page
In order to acess pagination clinics
As a user
I want to acess all pagination clinics

Scenario: Access to pagination clinic page
	Given I have accessed the clinics page
	When I press any number pagination
	Then should show 20 clinics per page