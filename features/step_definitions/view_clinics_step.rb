When(/^I press the imagem in 'Comunidades terapêuticas'$/) do
  page.find('#image_home_clinics').click
end

Then(/^I am redirected to the clinics page$/) do
  page.should have_title("SCT - Sistemas de Comunidades Terapeuticas")
end
