Given(/^I have accessed the home page$/) do
  visit '/home'
end

When(/^click on the 'Enviar' button$/) do
  click_button('Enviar')
end

Given(/^I'm logged with an admin account$/) do
  @user = User.create! :name=>"Admin", :email=>"admin2@email.com", :password=>"123456", :password_confirmation=>"123456", :level_user=>1, :user_authenticate=>1
  visit '/users'
  fill_in "Email", :with => @user.email
  fill_in "Senha", :with => @user.password
  page.find('#Logar').click
end