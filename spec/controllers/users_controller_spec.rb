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
      User.last.clinic = Clinic.last
      session[:user_id] = User.last.id

      get :index

      expect(response).to render_template(:index)
    end
  end

  describe "GET #login" do
    it "Should render users/login if user has request get" do
      session[:user_id] = nil
      get :login
      expect(response).to render_template(:login)
    end
  end

  describe "POST #login" do
    it "Should render login and show flash if user is missing or wrong email" do
      post :login, :do_login => { :email => "email@hotmail.com", :password => "123456" }
      expect(response).to render_template(:login)
      expect(flash[:error]).to be_present
    end

    it "Should redirect to users if user gets login" do
      post :login, :do_login => { :email => "vitor.nere@hotmail.com", :password => "123456" }
      expect(response).to redirect_to(:users)
    end

    it "Should render login and show flash if user input a wrong password" do
      post :login, :do_login => { :email => "vitor.nere@hotmail.com", :password => "1234569283" }
      expect(response).to render_template(:login)
      expect(flash[:error]).to be_present
    end
  end

  describe "GET #logout" do
    it "Should redirect to users if user was logged" do
      session[:user_id] = User.last.id
      get :logout
      expect(response).to redirect_to(:users)
    end
    #  xhr :get. :logout
    #  expect(response).to
  end

  describe "GET #profile" do
    it "Should render user's profile" do
      session[:user_id] = User.last.id
      get :profile
      expect(response).to render_template(:profile)
    end

    it "Should redirect to user's clinic profile" do
      User.last.clinic = Clinic.last
      session[:user_id] = User.last.id
      get :profile
      expect(response).to redirect_to(:users_clinic_profile)
    end
  end

  describe "GET #clinic_profile" do
    it "Should render user's clinic_profile if user was associated a clinic" do
      User.last.clinic = Clinic.last
      session[:user_id] = User.last.id
      get :clinic_profile
      expect(response).to render_template(:clinic_profile)
    end

    it "Should redirect to user's profile if user not associated a clinic" do
      session[:user_id] = User.last.id
      get :clinic_profile
      expect(response).to redirect_to(:users_profile)
    end
  end

  describe "GET #edit" do
    it "Should render edit" do
      session[:user_id] = User.last.id
      get :edit
      expect(response).to render_template(:edit)
    end
  end

  describe "GET #clinic_edit" do
    it "Should render edit" do
      User.last.clinic = Clinic.last
      session[:user_id] = User.last.id
      get :clinic_edit
      expect(response).to render_template(:clinic_edit)
    end

    it "Should redirect to edit if user not associated a clinic" do
      session[:user_id] = User.last.id
      get :clinic_edit
      expect(response).to redirect_to(:users_profile_edit)
    end
  end
end
