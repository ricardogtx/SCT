require 'rails_helper'

RSpec.describe ClinicsController, type: :controller do
  describe "GET / => clinics#index" do
    it "should set @clinics with attributes of clinics parser" do
      all_data = Clinic.all

      get :index

      expect(assigns(:clinics)).to match_array(all_data)
     end
   end

   describe "GET show" do
    it 'should show clinic' do
      @clinic = Clinic.create!(:nome => "clinica", :tipo_logradouro => "quadra", :nome_logradouro => "quadra", :numero_logradouro => "numero",
                          	   :complemento => "complemento", :bairro => "bairro", :cep => "cep", :municipio => "municipio",
                               :latitude => "latitude", :longitude => "longitude", :telefone_1 => "tel1", :telefone_2 => "tel2", :e_mail => "email",
                               :publico_atendido => "publico_atendido", :grupo_especifico => "grupo_especifico", :qual_grupo_especifico	=> "qual_grupo_especifico",
                               :sexo_do_publico => "sexo_do_publico", :modalidade => "modalidade")
      get :show,  id: @clinic.id
      expect(assigns(:clinic).nome).to eq(@clinic.nome)
    end
   end

   describe "PATCH/PUT #update" do
    it "Should update clinic and redirect to users" do
      State.create!(:name => "Distrito", :uf => "DF")
      @clinic = Clinic.create!(:nome => "clinica", :tipo_logradouro => "quadra", :nome_logradouro => "quadra", :numero_logradouro => "numero",
                               :complemento => "complemento", :bairro => "bairro", :cep => "cep", :municipio => "municipio",
                               :latitude => "latitude", :longitude => "longitude", :telefone_1 => "tel1", :telefone_2 => "tel2", :e_mail => "email",
                               :publico_atendido => "publico_atendido", :grupo_especifico => "grupo_especifico", :qual_grupo_especifico => "qual_grupo_especifico",
                               :sexo_do_publico => "sexo_do_publico", :modalidade => "modalidade", :state_id => 1)
      User.destroy_all
      User.create! :name=>"vitor", :email=>"vitor.nere@hotmail.com", :password=>"123456", :password_confirmation=>"123456"
      User.last.clinic = @clinic
      session[:user_id] = User.last.id
      expect {
        patch :update, id: @clinic.id, clinic: {:nome => "outra clinica"}
        @clinic.reload
      }.to change(@clinic, :nome).to("outra clinica")
      expect(response).to redirect_to(:users)
    end
   end
end