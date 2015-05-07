require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  before :all do
    User.destroy_all
    User.create! :name=>"vitor", :email=>"vitor.nere@hotmail.com", :password=>"123456", :password_confirmation=>"123456"
    Clinic.create! :nome=>"rspec", :tipo_logradouro=>"rspec", :nome_logradouro=>"rspec", :numero_logradouro=>"rspec", 
                   :complemento=>"rspec", :bairro=>"rspec", :cep=>"rspec", :estado=>"rspec", :municipio=>"rspec", :latitude=>"rspec", 
                   :longitude=>"rspec", :telefone_1=>"rspec", :telefone_2=>"rspec", :e_mail=>"rspec", :publico_atendido=>"rspec", 
                   :grupo_especifico=>"rspec", :qual_grupo_especifico=>"rspec", :sexo_do_publico=>"rspec", :modalidade=>"rspec"
  end

  describe "GET #new" do
    it "instance a new user" do
      get :new

      expect(assigns(:user)).to be_a(User)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST create" do
    it "should successfull create a user" do
      post :create, :user => {
        :name => "test user",
        :email => "test@rmail.com",
        :password => "123456",
        :password_confirmation => "123456"
      }

      expect(session[:user_id]).to eq(User.last.id)
      expect(response).to redirect_to(:users)
    end

    it "should not successfull create a user" do
      post :create, :user => {
        :name => "test user",
        :email => "test@rmail.com",
        :password => "124543",
        :password_confirmation => "12342342"
      }

      expect(session[:user_id]).to_not eq(User.last.id)
      expect(response).to render_template(:new)
    end
  end

  describe "GET index" do
    it "Should render index if user not logged" do
      session[:user_id] = nil
      get :index

      expect(response).to render_template(:index)
    end

    it "Should render index if user logged and doesn't associated to a clinic" do
      session[:user_id] = User.last.id

      get :index

      expect(response).to render_template(:index)
    end

    it "Should render users/clinic if user logged is associated to a clinic" do
      session[:user_id] = User.last.id
      User.last.clinic = Clinic.last

      get :index

      expect(response).to redirect_to(:users_clinic)
    end
  end
end
