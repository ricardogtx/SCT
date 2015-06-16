When(/^I press the imagem in 'informações'$/) do
  page.find('#image_home_drugs').click
end

Then(/^I am redirected to the drugs page$/) do
  page.should have_title("SCT - Sistemas de Comunidades Terapeuticas")
end 