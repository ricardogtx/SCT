When(/^I press the 'Editar Clínica' button$/) do
  page.find('#Editar').click
end

When(/^I edit information in the form$/) do
  fill_in 'nome', :with => "Nome"
  fill_in 'latitude', :with => "Latitude"
  fill_in 'longitude', :with => "Longitude"
  fill_in 'telefone_1', :with => "Telefone_1"
  fill_in 'telefone_2', :with => "Telefone_2"
  fill_in 'email_field', :with => "Email"
  fill_in 'modalidade', :with => "Modalidade"
  click_button 'Enviar'
end

Then(/^I am redirected to the users page$/) do
  expect(page).to have_content('Você está logado com o email ' + @user.email)
end
