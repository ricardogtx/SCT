When(/^I click on the 'VISUALIZAR CAMPANHAS' button$/) do
  page.find('#cad_index').click
end

Then(/^I see 'campaigns'$/) do
  current_path.should == campanhas_path
end