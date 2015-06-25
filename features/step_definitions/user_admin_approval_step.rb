Given(/^there's an user account already approved in the database$/) do
  @approved_user = User.create! :name=>"Cucumber", :email=>"test_cucumber@email.com", :password=>"123456",
               :password_confirmation=>"123456", :level_user=>nil,
               :user_authenticate=>1
  @approved_clinic = Clinic.create! :nome=>"string", :tipo_logradouro=>"string", :nome_logradouro=>"string", :numero_logradouro=>"string",
                   :complemento=>"string", :bairro=>"string", :cep=>"string", :estado=>"string", :municipio=>"string", :latitude=>"string",
                   :longitude=>"string", :telefone_1=>"string", :telefone_2=>"string", :e_mail=>"test_cucumber@email.com", :publico_atendido=>"string",
                   :grupo_especifico=>"string", :qual_grupo_especifico=>"string", :sexo_do_publico=>"string", :modalidade=>"string"
end

When(/^I fill the Buscar field with the user email$/) do
  fill_in "Email", :with => @approved_user.email
  click_button('Buscar')
end

Then(/^I'm redirected to the user admin approval page$/) do
  expect(current_path).to eq(user_admin_applying_path)
end

When(/^I fill the Buscar field with a nonexisting user email$/) do
  fill_in "Email", :with => "cucumber_fail@test.com"
  click_button('Buscar')
end

Then(/^I'm redirected to the admin page with a fail message$/) do
  expect(current_path).to eq(admin_path)
  expect(page).to have_content('Usuário não encontrado')
end

When(/^I click the "(.*?)" button$/) do |link|
  click_link(link)
end

Then(/^I'm redirected to the admin page with a succesful attribuition message$/) do
  expect(current_path).to eq(admin_path)
  expect(page).to have_content("Foi dado permissões de Administrador ao Usuário")
end

Then(/^the user account now has admin access level$/) do
  @approved_user.reload
  expect(@approved_user.level_user).to be(1)
end

Then(/^I'm redirected to the admin page with the "(.*?)" message$/) do |text|
  expect(page).to have_content(text)
end

Then(/^the user account is not authenticated anymore and loses his admin access level$/) do
  @approved_user.reload
  expect(@approved_user.user_authenticate).to eq(nil)
  expect(@approved_user.level_user).to eq(nil)
end
