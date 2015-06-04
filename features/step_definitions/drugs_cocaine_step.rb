When(/^I press the 'Saiba mais' button in cocaine$/) do
  page.find('#btn_cocaine').click
end

Then(/^I am redirected to the cocaine page$/) do
  page.should have_title("SCT - Sistemas de Comunidades Terapeuticas")
end
