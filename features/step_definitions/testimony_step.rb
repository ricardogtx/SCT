Given(/^I visit the new testimony page$/) do
	visit '/depoimentos'
end

Given(/^click in "(.*?)"$/) do |link|
 	click_link (link)
end

When(/^I fill the new testimony form$/) do
 	fill_in 'testimonial_title', :with => "titulo"
 	fill_in 'testimonial_body', :with => "campo"
end

Then(/^should create a testimony$/) do
 	have_content('testimonial_title') 
end
