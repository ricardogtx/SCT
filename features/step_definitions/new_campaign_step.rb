Given(/^I'm logged with a admin account$/) do
  @user = User.create! :name=>"Admin", :email=>"admin2@email.com", :password=>"123456", :password_confirmation=>"123456", :level_user=>1, :user_authenticate=>1
  visit '/users'
  fill_in "Email", :with => @user.email
  fill_in "Senha", :with => @user.password
  page.find('#Logar').click

end

When(/^I click on the 'NOVA CAMPANHA' button$/) do
  page.find('#cad_new').click
end

Then(/^I see 'campaigns\/new'$/) do
  current_path.should == campanhas_nova_path
end

Given(/^I have accessed the campaign\/new page$/) do
  visit '/campanhas/nova'
end

When(/^I fill the new campaign form$/) do
  fill_in 'campaign_name', :with => "nome"
  fill_in 'campaign_url', :with => "url"
  fill_in 'campaign_description', :with => "descricao" 
end

Then(/^should create a campaign$/) do
  have_content('campaign_description')
end


