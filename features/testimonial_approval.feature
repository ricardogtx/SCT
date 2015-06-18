Feature: Testimonial approval
As an admin
I want to approve the testimonials sent by the users

Scenario: accept testimonial
	Given there is a testimonial waiting for my approval
	And I'm logged with an admin account
	When I click on the testimonial name
	Then I'm redirected to that testimonial specific page

Scenario: edit testimonial
	Given there is a testimonial waiting for my approval
	And I'm logged with an admin account
	And I click on the testimonial name
	When I click on Editar button
	Then I'm redirected to that testimonial edit page.

Scenario: approve testimonial
	Given there is a testimonial waiting for my approval
	And I'm logged with an admin account
	And I click on the testimonial name
	When I click on Aceitar button
	Then I'm redirected to the admin page with a succesful message

Scenario: refuse testimonial
	Given there is a testimonial waiting for my approval
	And I'm logged with an admin account
	And I click on the testimonial name
	When I click on Recusar button
	Then I'm redirected to the admin page with a succesful deletion message