Given(/^I have accessed the home page$/) do
  visit '/home'
end

When(/^click on the 'Enviar' button$/) do
  click_button('Enviar')
end