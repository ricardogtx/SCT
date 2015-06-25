When(/^click in 'SAIBA MAIS!'' under 'Mapas'$/) do
  page.find('#btn_clinics_2').click
end

When(/^I click in a clinic$/) do
  click_link(@clinic)
end

Then(/^I should see the localization of that clinic in the map$/) do
  have_content(@clinic)
end