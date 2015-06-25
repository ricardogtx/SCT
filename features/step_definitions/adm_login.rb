Given(/^I have an admin account$/) do
  @user = User.create! :name=>"Admin", :email=>"cucumber_admin@email.com", :password=>"123456", :password_confirmation=>"123456", :level_user=>1, :user_authenticate=>1
end

When(/^I enter my email and password correctly, using an admin account$/) do
  @user.clinic = @clinic
  fill_in "Email", :with => @user.email
  fill_in "Senha", :with => @user.password
  page.find('#Logar').click
end

