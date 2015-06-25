Given(/^I visit the drugs page$/) do
	visit '/drogas' 
end

Given(/^I have a drug in the database$/) do
   @drug = Drug.create! :name => "cucumber drug", :description => "cucumber drug", :drug_type => "cucumber drug", :origin => "cucumber drug", :average_ingest => "cucumber drug", :ingestion_form => "cucumber drug", :duration => "cucumber drug", :effect_high => "cucumber drug", :dependence_psychological => "cucumber drug", :dependence_phisical => "cucumber drug", :tolerance => "cucumber drug", :long_effects => "cucumber drug", :medical_use => "cucumber drug"      
end

When(/^I press the "(.*?)" button of any given drug$/) do |link|
  click_link(@drug.id)
end

Then(/^I am redirected to that drug information page$/) do
  expect(current_path).to eq("/drugs/#{@drug.id}")
end

