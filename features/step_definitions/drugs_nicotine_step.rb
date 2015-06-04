When(/^I press the 'Saiba mais' button in nicotine$/) do
  page.find('#btn_nicotine').click
end

Then(/^I am redirected to the nicotine page$/) do
  page.should have_title("SCT - Sistemas de Comunidades Terapeuticas")
end
