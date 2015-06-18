When(/^I press the Saiba mais button$/) do
  page.find('#btn_saiba_mais').click
end

Then(/^I am redirected to the Saiba Mais page$/) do
  page.should have_title("Saiba Mais")
end