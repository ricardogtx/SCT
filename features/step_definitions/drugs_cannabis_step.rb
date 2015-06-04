When(/^I press the 'Saiba mais' button in cannabis$/) do
  page.find('#btn_cannabis').click
end

Then(/^I am redirected to the cannabis page$/) do
  page.should have_title("SCT - Sistemas de Comunidades Terapeuticas")
end