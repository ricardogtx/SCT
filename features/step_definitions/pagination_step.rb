Given(/^I have accessed the clinics page$/) do
  visit('/clinics')
end

When(/^I press any number of pagination$/) do
  click_link (@will_paginate)
end

Then(/^it should show (\d+) clinics per page$/) do |clinics|
  have_content(@clinics)
end
