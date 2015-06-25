
When(/^I press the button 'SAIBA MAIS!' in 'Comunidades terapêuticas'$/) do
  page.find('#btn_clinics_1').click
end

Then(/^I am redirected to the clinics page$/) do
  page.should have_title("SCT - Sistemas de Comunidades Terapeuticas")
end
