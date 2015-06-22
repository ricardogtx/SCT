Then(/^it not should display "(.*?)"$/) do |link|
  expect(page).not_to have_content(link)
end
