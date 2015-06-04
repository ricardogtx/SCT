When(/^I press the Saiba mais button in hallucinogens$/) do
  page.find('#btn_hallucinogen').click
end

Then(/^I am redirected to the hallucinoges page$/) do
  page.should have_title("SCT - Sistemas de Comunidades Terapeuticas")
end

