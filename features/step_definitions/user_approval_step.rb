Given(/^there is a user waiting for my approval$/) do
 @new_user = User.create! :name=>"Cucumber", :email=>"cucumber@email.com", :password=>"123456",
               :password_confirmation=>"123456", :level_user=>nil,
               :user_authenticate=>nil
@new_clinic = Clinic.create! :nome=>"string", :tipo_logradouro=>"string", :nome_logradouro=>"string", :numero_logradouro=>"string",
                   :complemento=>"string", :bairro=>"string", :cep=>"string", :estado=>"string", :municipio=>"string", :latitude=>"string",
                   :longitude=>"string", :telefone_1=>"string", :telefone_2=>"string", :e_mail=>"cucumber@email.com", :publico_atendido=>"string",
                   :grupo_especifico=>"string", :qual_grupo_especifico=>"string", :sexo_do_publico=>"string", :modalidade=>"string"
end

When(/^I click on the user's email$/) do
  click_link(@new_user.email)
end

Then(/^I'm redirected to that user's specific page$/) do
  expect(current_path).to eq(users_approval_path)
end

When(/^I click on Associar e Liberar button$/) do
  click_link('Associar e Liberar')
end

Then(/^I'm redirected to the admin page with a successful approval message$/) do
  expect(current_path).to eq(admin_path)
  expect(page).to have_content('Usuário associado e aprovado')
end

When(/^I click on Recusar e Deletar button$/) do
  click_link('Recusar e Deletar')
end

Then(/^I'm redirected to the admin page with a successful deletion message$/) do
  expect(current_path).to eq(admin_path)
  expect(page).to have_content('Usuário deletado')
end

