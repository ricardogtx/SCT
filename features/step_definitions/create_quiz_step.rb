Given(/^I visit the questions page$/) do
  visit('/questions')
end

When(/^I press the link "(.*?)"$/) do |link|
  click_link(link)
end

When(/^I fill the text field$/) do
  fill_in 'question_content', :with => "pergunta"
end

When(/^I press the button 'Enviar'$/) do
  page.find('#btn_submit').click
end

Then(/^it should display the message 'Criado com sucesso!'$/) do
  expect(page).to have_content('Criado com sucesso!')
end