    require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  before :all do
    User.destroy_all
    User.create! :id=>1, :name=>"vitor", :email=>"vitor.nere@hotmail.com", :password=>"123456", :password_confirmation=>"123456", :user_authenticate=>1
    Clinic.create! :nome=>"rspec", :tipo_logradouro=>"rspec", :nome_logradouro=>"rspec", :numero_logradouro=>"rspec",
                   :complemento=>"rspec", :bairro=>"rspec", :cep=>"rspec", :estado=>"rspec", :municipio=>"rspec", :latitude=>"rspec",
                   :longitude=>"rspec", :telefone_1=>"rspec", :telefone_2=>"rspec", :e_mail=>"vitor.nere@hotmail.com", :publico_atendido=>"rspec",
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

    it "Should redirect to logout if user logged and doesn't associated to a clinic" do
      session[:user_id] = User.last.id

      get :index

      expect(response).to redirect_to(:logout)
    end

    it "Should render users if user logged is associated to a clinic" do
      User.last.clinic = Clinic.last
      session[:user_id] = User.last.id

      get :index

      expect(response).to render_template(:index)
    end

    it "Should render admin if user logged is admin" do
      user = User.last
      user.update_attributes(:level_user => 1)
      session[:user_id] = User.last.id

      get :index

      expect(response).to redirect_to(:admin)
    end
  end

  describe "POST #index - login" do
    it "Should render index and show flash if user is missing or wrong email" do
      post :index, :do_login => { :email => "email@hotmail.com", :password => "123456" }
      expect(response).to render_template(:index)
      expect(flash[:error]).to be_present
    end

    it "Should redirect to users if user gets login" do
      User.last.clinic = Clinic.last
      post :index, :do_login => { :email => "vitor.nere@hotmail.com", :password => "123456" }
      expect(response).to redirect_to(:users)
    end

    it "Should render login and show flash if user input a wrong password" do
      post :index, :do_login => { :email => "vitor.nere@hotmail.com", :password => "1234569283" }
      expect(response).to render_template(:index)
      expect(flash[:error]).to be_present
    end

    it "Should be show flash if params nil" do
      post :index, :do_login => { :email => "", :password => "" }
      expect(response).to render_template(:index)
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
      User.last.clinic = Clinic.last
      session[:user_id] = User.last.id
      get :profile
      expect(response).to render_template(:profile)
    end
  end

  describe "GET #edit" do
    it "Should render edit" do
      User.last.clinic = Clinic.last
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

    it "Should render edit if user not associated a clinic" do
      User.last.clinic = Clinic.last
      session[:user_id] = User.last.id
      get :clinic_edit
      expect(response).to render_template(:clinic_edit)
    end
  end

  describe "PATCH/PUT #update" do
    it "Shoud update e_mail and redirect to users_profile" do
      User.last.clinic = Clinic.last
      @user = User.last
      session[:user_id] = User.last.id
      expect {
        patch :update, id: @user.id, user: {:email => "teste@hotmail.com"}
        @user.reload
      }.to change(@user, :email).to("teste@hotmail.com")
      expect(response).to redirect_to(:users_profile)
    end
  end

  describe "GET #Admin" do
    it "Should be render admin if admin logged" do
      user = User.last
      user.update_attributes(:level_user => 1)
      session[:user_id] = User.last.id

      get :admin

      expect(response).to render_template(:admin)
    end

    it "Should redirect to logout if admin not logged" do
      user = User.last
      session[:user_id] = User.last.id

      get :admin

      expect(response).to redirect_to(:logout)
    end

    it "Should redirect to user user admin applying if email exist" do
      user = User.last
      user.update_attributes(:level_user => 1)
      session[:user_id] = User.last.id

      post :admin, :user_email => { :email => "vitor.nere@hotmail.com" }

      expect(response).to redirect_to("http://test.host/users/admin/user_admin_applying?id=1")
    end

    it "Should redirect to user admin if email not exist" do
      user = User.last
      user.update_attributes(:level_user => 1)
      session[:user_id] = User.last.id

      post :admin, :user_email => { :email => "vitor2.nere@hotmail.com" }

      expect(response).to redirect_to(:admin)
      expect(flash[:notice]).to be_present
    end
  end

  describe "Get #users_approval" do
    it "Should be render users_approval if admin logged" do
      user = User.last
      user.update_attributes(:level_user => 1)
      session[:user_id] = User.last.id

      get :users_approval, :user_id => 1

      expect(response).to render_template(:users_approval)
    end
  end

  describe "Get #users_approval_confirm" do
    it "Should be authenticate and clinic's associate a user" do
      user = User.last
      user.update_attributes(:level_user => 1)
      session[:user_id] = User.last.id

      get :users_approval_confirm, :id => 1

      expect(response).to redirect_to(:admin)
    end

    it "Should be redirect to admin if put wrong email" do
      user = User.last
      user.update_attributes(:level_user => 1)
      session[:user_id] = User.last.id
      User.create! :id=>2, :name=>"vitor", :email=>"vitor.nere2@hotmail.com", :password=>"123456", :password_confirmation=>"123456", :user_authenticate=>1

      get :users_approval_confirm, :id => 2

      expect(response).to redirect_to(:admin)
    end
  end

  describe "Get #users_approval_decline" do
    it "Should be deleted user" do
      user = User.last
      user.update_attributes(:level_user => 1)
      session[:user_id] = User.last.id

      get :users_approval_decline, id: 1

      expect(response).to redirect_to(:admin)
    end
  end

  describe "Get #testimonials_approval_edit" do
    it "Should be redirect to page for edit testimonial" do
      user = User.last
      user.update_attributes(:level_user => 1)
      session[:user_id] = User.last.id
      Testimonial.destroy_all
      Testimonial.create! :id=>1, :title=>"abc", :body=>"abc"

      get :testimonials_approval_edit, id: 1

      expect(response).to render_template(:testimonials_approval_edit)
    end

    it "It does not allow editing of a testimony already authenticated " do
      user = User.last
      user.update_attributes(:level_user => 1)
      session[:user_id] = User.last.id
      Testimonial.destroy_all
      Testimonial.create! :id=>1, :title=>"abc", :body=>"abc", :testimonial_authenticate=>1

      get :testimonials_approval_edit, id: 1

      expect(response).to redirect_to(:admin)
    end
  end

  describe "Get #testimonial_approval" do
    it "Should be show a testimonial for approval" do
      user = User.last
      user.update_attributes(:level_user => 1)
      session[:user_id] = User.last.id
      Testimonial.destroy_all
      testimonial = Testimonial.create! :id=>1, :title=>"abc", :body=>"abc"

      get :testimonial_approval, testimonial_id: 1

      expect(response).to render_template(:testimonial_approval)
    end
  end

  describe "Get #testimonials_approval_confirm" do
    it "Should be confirm a testimonial" do
      user = User.last
      user.update_attributes(:level_user => 1)
      session[:user_id] = User.last.id
      Testimonial.destroy_all
      testimonial = Testimonial.create! :id=>1, :title=>"abc", :body=>"abc"

      get :testimonials_approval_confirm, :id=>1

      expect(response).to redirect_to(:admin)
    end
  end

  describe "Get #testimonials_approval_decline" do
    it "Should be reject a testimonial and delete" do
      user = User.last
      user.update_attributes(:level_user => 1)
      session[:user_id] = User.last.id
      Testimonial.destroy_all
      testimonial = Testimonial.create! :id=>1, :title=>"abc", :body=>"abc"

      get :testimonials_approval_decline, :id=>1

      expect(response).to redirect_to(:admin)
    end
  end

  describe "Get #user_admin_applying" do
    it "Should be show user to be assigned level administrator" do
      user = User.last
      user.update_attributes(:level_user => 1)
      session[:user_id] = User.last.id

      get :user_admin_applying, :id=>1

      expect(response).to render_template(:user_admin_applying)
    end
  end

  describe "Get #user_admin_applying_confirm" do
    it "Should be assign administrator level to a user" do
      user = User.last
      user.update_attributes(:level_user => 1)
      session[:user_id] = User.last.id

      get :user_admin_applying_confirm, :id=>1

      expect(response).to redirect_to(:admin)
    end
  end

  describe "Get #user_admin_applying_decline" do
    it "Should be removing administrator level to a user" do
      user = User.last
      user.update_attributes(:level_user => 1)
      session[:user_id] = User.last.id

      get :user_admin_applying_decline, :id=>1

      expect(response).to redirect_to(:admin)
    end
  end
end


