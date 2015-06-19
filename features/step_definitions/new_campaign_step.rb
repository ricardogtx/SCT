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

When(/^click on the 'Enviar' button$/) do
  click_button('Enviar')
end

Then(/^should create a campaign$/) do
  have_content('campaign_description')
end
