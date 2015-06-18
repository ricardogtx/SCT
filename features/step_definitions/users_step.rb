Given(/^I visit the new user page$/) do
  visit '/users/new'
end

When(/^I fill the new user form$/) do
  fill_in "Nome", :with => @name
  fill_in "Email", :with => @email
  fill_in "Senha", :with => @passworld
  fill_in "Senha", :with => @passworld_confirmation
end

Then(/^I should me register$/) do
	have_content(@nome)
end
