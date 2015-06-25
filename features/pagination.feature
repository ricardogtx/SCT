Feature: pagination in the clinic page
	In order to organize the clinics listed to me
	As a user
	I want to paginate the clinics list

Scenario: paginate the clinics page
	Given I have accessed the clinics page
	When I press any number of pagination
	Then it should show 20 clinics per page