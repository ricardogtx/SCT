When(/^I go to "(.*?)"$/) do |link|
  visit (link)
end

When(/^I press 'Cancelar'$/) do
  page.find('#btn_cancel').click
end

Then(/^it should display the message 'Questão atualizada\.'$/) do
  expect(page).to have_content('Questão atualizada.')
end

