When(/^I press the Saiba mais button in barbiturates$/) do
  page.find('#btn_barbiturates').click
end

Then(/^I am redirected to the barbiturates page$/) do
  page.should have_title("SCT - Sistemas de Comunidades Terapeuticas")
end
