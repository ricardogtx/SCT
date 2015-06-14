When(/^click in 'SAIBA MAIS!'' in 'Mapas'$/) do
  page.find('#btn_clinics_2').click
end

When(/^I to press a clinic$/) do
  click_link(@clinic)
end

Then(/^should localization of clinic$/) do
  have_content(@clinic)
end