When(/^I click on the 'VISUALIZAR CAMPANHAS' button$/) do
  page.find('#cad_index').click
end

Then(/^I see 'campaigns'$/) do
  expect(current_path).to eq(campanhas_path)
end