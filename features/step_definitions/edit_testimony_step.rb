Given(/^I have do "(.*?)"$/) do |testimonial|
  @testimonial = Testimonial.new
  @testimonial.body = "body"
  @testimonial.title = "title"
  @testimonial.save
end

Given(/^I press link "(.*?)"$/) do |link|
  click_link(link)
end

Then(/^should edit a testimony$/) do
  have_content('testimonial_title') 
  have_content('testimonial_body')
end