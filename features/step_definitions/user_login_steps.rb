Given(/^I have accessed the login page$/) do
  visit '/users'
end

Given(/^I already have an account$/) do
  @user = User.create! :name=>"vitor", :email=>"vitor.nere@hotmail.com", :password=>"123456", :password_confirmation=>"123456"
  @clinic = Clinic.create! :nome=>"rspec", :tipo_logradouro=>"rspec", :nome_logradouro=>"rspec", :numero_logradouro=>"rspec",
                   :complemento=>"rspec", :bairro=>"rspec", :cep=>"rspec", :estado=>"rspec", :municipio=>"rspec", :latitude=>"rspec",
                   :longitude=>"rspec", :telefone_1=>"rspec", :telefone_2=>"rspec", :e_mail=>"rspec", :publico_atendido=>"rspec",
                   :grupo_especifico=>"rspec", :qual_grupo_especifico=>"rspec", :sexo_do_publico=>"rspec", :modalidade=>"rspec"
	@user.clinic = @clinic                   
end
   

When(/^I enter my email and password correctly$/) do
  fill_in "Email", :with => @user.email
  fill_in "Senha", :with => @user.password
  page.find('#Logar').click
end

Then(/^I am logged in the site\.$/) do
  page.should have_content('Informações da Clínica')
end
