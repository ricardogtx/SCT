Feature: Delete quiz
  In order to delete a question of quiz
  As admin 
  I want to delete a question

  Scenario: To delete a question 
		Given I visit the questions page
		When I go to "/questions/1"
		Then it not should display "/questions/1"