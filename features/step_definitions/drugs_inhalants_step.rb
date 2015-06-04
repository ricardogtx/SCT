When(/^I press the 'Saiba mais' button in inhalants$/) do
  page.find('#btn_inhalants').click
end

Then(/^I am redirected to the inhalants page$/) do
  page.should have_title("SCT - Sistemas de Comunidades Terapeuticas")
end
