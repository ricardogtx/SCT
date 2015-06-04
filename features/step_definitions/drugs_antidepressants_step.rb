When(/^I press the 'Saiba mais' button in antidepressants$/) do
  page.find('#btn_antidepressant').click
end

Then(/^I am redirected to the antidepressants page$/) do
  page.should have_title("SCT - Sistemas de Comunidades Terapeuticas")
end