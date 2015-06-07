Given(/^I have accessed the login page$/) do
  visit '/users'
end

Given(/^I already have an account$/) do
  @user = User.create! :name=>"name", :email=>"email@email.com", :password=>"123456", :password_confirmation=>"123456"
  @clinic = Clinic.create! :nome=>"word", :tipo_logradouro=>"word", :nome_logradouro=>"word", :numero_logradouro=>"word", :complemento=>"word", :bairro=>"word", :cep=>"word", 
  :estado=>"word", :municipio=>"word", :latitude=>"word",
  :longitude=>"word", :telefone_1=>"word", :telefone_2=>"word", :e_mail=>"word", :publico_atendido=>"word",
  :grupo_especifico=>"word", :qual_grupo_especifico=>"word", :sexo_do_publico=>"word", :modalidade=>"word"
  @user.clinic = @clinic
end

When(/^I enter my email and password correctly$/) do
  fill_in "Email", :with => @user.email
  fill_in "Senha", :with => "654321"
  page.find('#Logar').click
end

When(/^I press the 'Editar Clínica' button$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I edit information in the form$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am redirected to the users page$/) do
  pending # express the regexp above with the code you wish you had
end
