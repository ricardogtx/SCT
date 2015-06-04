When(/^I press the 'Saiba mais' button in amphetamines$/) do
  page.find('#btn_amphetamine').click
end

Then(/^I am redirected to the ampheamines page$/) do
  page.should have_title("SCT - Sistemas de Comunidades Terapeuticas")
end