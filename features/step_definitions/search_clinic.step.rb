Clinic.create!(:nome => "Clinica A", :estado => "Estado A", :modalidade => "Modalidade A")
Clinic.create!(:nome => "Clinica B", :estado => "Estado B", :modalidade => "Modalidade B")
Clinic.create!(:nome => "Clinica C", :estado => "Estado C", :modalidade => "Modalidade F")


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

When(/^I fill in a string in the estate filter$/) do
  fill_in('Estado', :with => 'Estado A')
end

Then(/^the list shows only the clinics that contains that string in the estate$/) do
	expect(page).not_to have_content('Estado B')
  expect(page).not_to have_content('Estado C')
end

When(/^I fill in a string in the modality filter$/) do
  fill_in('Modalidade', :with => 'Modalidade A')
end

Then(/^the list shows only the clinics that contains that string in the modality$/) do
  expect(page).not_to have_content('Modalidade B')
  expect(page).not_to have_content('Modalidade F')
end
