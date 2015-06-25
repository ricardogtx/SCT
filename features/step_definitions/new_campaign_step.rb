When(/^I click on the 'NOVA CAMPANHA' button$/) do
  page.find('#cad_new').click
end

Then(/^I see 'campaigns\/new'$/) do
  expect(current_path).to eq(campanhas_nova_path)
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


