Feature: user approval
  In order to avoid fake users
  As an admin
  I want to approve the new users

Scenario: user approval
  Given there is a user waiting for my approval
  And I'm logged with an admin account
  When I click on the user's email
  Then I'm redirected to that user's specific page

Scenario: accept new user
  Given there is a user waiting for my approval
  And I'm logged with an admin account
  And I click on the user's email
  When I click on Associar e Liberar button
  Then I'm redirected to the admin page with a successful approval message

Scenario: refuse new user
  Given there is a user waiting for my approval
  And I'm logged with an admin account
  And I click on the user's email
  When I click on Recusar e Deletar button
  Then I'm redirected to the admin page with a successful deletion message