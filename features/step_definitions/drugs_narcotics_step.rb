When(/^I press the 'Saiba mais' button in narcotics$/) do
  page.find('#btn_narcotics').click
end

Then(/^I am redirected to the narcotics page$/) do
  page.should have_title("SCT - Sistemas de Comunidades Terapeuticas")
end