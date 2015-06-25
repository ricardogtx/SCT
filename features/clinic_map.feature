Feature: clinic map
  In order to discover a clinic location
  As a user
  I want to view the clinic's position in the map
  
  Scenario: view the clinic's position
    
    Given I visit the home page
	  When click in 'SAIBA MAIS!'' under 'Mapas'
    And I click in a clinic
	  Then I should see the localization of that clinic in the map