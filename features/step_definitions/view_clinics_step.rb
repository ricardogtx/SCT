When(/^I press the button 'SAIBA MAIS!' in 'Comunidades terapêuticas'$/) do
  page.find('#btn_clinics_1').click
end

Then(/^I am redirected to the clinics page$/) do
  expect(page).to have_title("SCT - Sistemas de Comunidades Terapeuticas")
end
