When(/^I press the 'Saiba mais' button in tranquilizer$/) do
  page.find('#btn_tranquilizer').click
end

Then(/^I am redirected to the tranquilizer page$/) do
  page.should have_title("SCT - Sistemas de Comunidades Terapeuticas")
end
