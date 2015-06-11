Given(/^I have accessed the home page$/) do
  visit '/home'
end

When(/^I click on the 'VISUALIZAR CAMPANHAS' button$/) do
  page.find('#cad_index').click
end

Then(/^I see 'campaigns'$/) do
  current_path.should == campanhas_path
end

When(/^I click on the 'NOVA CAMPANHA' button$/) do
  page.find('#cad_new').click
end

Then(/^I see 'campaigns\/new'$/) do
  current_path.should == campanhas_nova_path
end