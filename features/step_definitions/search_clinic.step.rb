Given(/^I have more than one registered clinic$/) do
  Clinic.create!(:nome => "Clinica A", :estado => "Estado A", :modalidade => "Modalidade A")
  Clinic.create!(:nome => "Clinica B", :estado => "Estado A", :modalidade => "Modalidade B")
  Clinic.create!(:nome => "Clinica C", :estado => "Estado B", :modalidade => "Modalidade F")
  State.create!(:name => "Estado A", :uf => "A")
  State.create!(:name => "Estado B", :uf => "B")
end

Given(/^I have accessed the clinic page$/) do
  visit '/clinics'
end

When(/^I fill in a string in the name filter$/) do
  fill_in('Nome', :with => 'Clinica A')
end

When(/^I press the Buscar button$/) do
  click_button('Buscar')
end

Then(/^the list shows only the clinics that contains that string in the name$/) do
  expect(page).not_to have_content('Clinica B')
  expect(page).not_to have_content('Clinica C')
end

When(/^I select a specific estate$/) do
  select("Estado A", :from => "q_state_id_eq")
  
end

Then(/^the list shows only the clinics that belongs to that estate$/) do
	expect(page).not_to have_content('Estado C')
end

When(/^I fill in a string in the modality filter$/) do
  fill_in('Modalidade', :with => 'Modalidade A')
end

Then(/^the list shows only the clinics that contains that string in the modality$/) do
  expect(page).not_to have_content('Modalidade B')
  expect(page).not_to have_content('Modalidade F')
end
