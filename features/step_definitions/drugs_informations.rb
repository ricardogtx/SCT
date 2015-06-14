When(/^I press the button 'SAIBA MAIS!' in 'Drogas'$/) do
  page.find('#btn_drugs').click
end

Then(/^I am redirected to the drugs page$/) do
  page.should have_title("SCT - Sistemas de Comunidades Terapeuticas")
end 