Given(/^I have accessed the login page$/) do
  visit '/users'
end

Given(/^I already have an account$/) do
  @user = User.create! :name=>"cucumber", :email=>"cucumber@test.com", :password=>"123456", :password_confirmation=>"123456"
  @clinic = Clinic.create! :nome=>"string", :tipo_logradouro=>"string", :nome_logradouro=>"string", :numero_logradouro=>"string",
                   :complemento=>"string", :bairro=>"string", :cep=>"string", :estado=>"string", :municipio=>"string", :latitude=>"string",
                   :longitude=>"string", :telefone_1=>"string", :telefone_2=>"string", :e_mail=>"string", :publico_atendido=>"string",
                   :grupo_especifico=>"string", :qual_grupo_especifico=>"string", :sexo_do_publico=>"string", :modalidade=>"string"
	                
end

When(/^I try to login with a wrong email$/) do
  fill_in "Email", :with => @user.email
  fill_in "Senha", :with => "654321"
  page.find('#Logar').click
end

When(/^I try to login with a wrong password$/) do
 	fill_in "Email", :with => @user.email
  fill_in "Senha", :with => @user.password
  page.find('#Logar').click
end

When(/^I enter my email and password correctly, but don't have an associated clinic$/) do
  fill_in "Email", :with => @user.email
  fill_in "Senha", :with => @user.password
  page.find('#Logar').click
end

Then(/^I am redirected to the login page$/) do
  page.should have_content('Bem vindo a página de login/cadastro do SCT')
end   

When(/^I enter my email and password correctly, and have an associated clinic$/) do
  @user.clinic = @clinic
  fill_in "Email", :with => @user.email
  fill_in "Senha", :with => @user.password
  page.find('#Logar').click
end

Then(/^I am logged in the site$/) do
  page.should have_content('Você está logado com o email ' + @user.email)
end



