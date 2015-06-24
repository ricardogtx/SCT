Given(/^I visit the home page$/) do
  visit '/home'
end

Given(/^click in tab "(.*?)" in nav bar$/) do |link|
  click_link (link)
end

Given(/^I press the button Novo$/) do
  page.find('#margin_correction_new').click
end

When(/^I fill the new testimony form$/) do
 	fill_in 'testimonial_title', :with => "titulo"
 	fill_in 'testimonial_body', :with => "campo"
end

Then(/^should create a testimony$/) do
 	have_content('testimonial_title') 
 	have_content('testimonial_body')
end


