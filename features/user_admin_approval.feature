Feature: create admin account
As an admin
I want to control the admin access level from the users accounts

Scenario: acces user admin approval page
   Given there's an user account already approved in the database
   And I'm logged with an admin account
   When I fill the Buscar field with the user email
   Then I'm redirected to the user admin approval page

Scenario: try to access the adming approval page with a nonexisting email
   Given there's an user account already approved in the database
   And I'm logged with an admin account
   When I fill the Buscar field with a nonexisting user email
   Then I'm redirected to the admin page with a fail message

Scenario: give admin access level to user
  Given there's an user account already approved in the database
  And I'm logged with an admin account
  When I fill the Buscar field with the user email
  And I click the "Atribuir level de Administrador" button
  Then I'm redirected to the admin page with a succesful attribuition message
  And the user account now has admin access level

Scenario: remove admin access level from user
  Given there's an user account already approved in the database
  And I'm logged with an admin account
  When I fill the Buscar field with the user email
  And I click the "Retirar level de Administrador" button
  Then I'm redirected to the admin page with the "Foi retirado as permissões de Administrador do Usuário" message
  And the user account is not authenticated anymore and loses his admin access level


