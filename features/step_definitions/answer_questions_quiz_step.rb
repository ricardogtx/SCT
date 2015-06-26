Given(/^I visit the first question page$/) do
  visit '/questions/1'
end

Then(/^it should display the message 'Pontuação total: (\d+) de (\d+)'$/) do |counter, id|
  expect(page).to have_content(counter)
  expect(page).to have_content(id)
end

When(/^I press 'SIM'$/) do
  page.find('#question_answer_true').click
end
