Given(/^I have accessed the clinics page$/) do
  visit('/clinics')
end

When(/^I press any number pagination$/) do
  click_link (@will_paginate)
end

Then(/^should show (\d+) clinics per page$/) do |clinics|
  have_content(@clinics)
end
