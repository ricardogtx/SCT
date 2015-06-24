Feature: Clinic map
  In order to view clinic map
  As a user
  I want to view clinic map
  
  Scenario: To view clinic map
    
    Given I visit the home page
	  When click in 'SAIBA MAIS!'' in 'Mapas'
    And I to press a clinic
	  Then should localization of clinic