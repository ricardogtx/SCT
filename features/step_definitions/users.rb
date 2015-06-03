Given(/^I visit the new user page$/) do
  visit '/users/new'
end

When(/^I fill the new user form$/) do
  @user = User.new
  fill_in "Nome", :with => @name
  fill_in "Email", :with => @email
  fill_in "Senha", :with => @passworld
  fill_in "Senha", :with => @passworld_confirmation
end

When(/^click on the 'Enviar' button$/) do
  click_button 'Enviar'
end

Then(/^I should me register$/) do
end
