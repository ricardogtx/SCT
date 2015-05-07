require 'rails_helper'

RSpec.describe ClinicsController, type: :controller do
  describe "GET / => clinics#index" do
    it "should set @clinics with attributes of clinics parser" do
      all_data = Clinic.all

      get :index

      expect(assigns(:clinics)).to match_array(all_data)
     end
   end
   describe 'GET show' do
    it 'should show clinic' do
      @clinic = Clinic.create!(:nome => "clinica", :tipo_logradouro => "quadra", :nome_logradouro => "quadra", :numero_logradouro => "numero",
                          	   :complemento => "complemento", :bairro => "bairro", :cep => "cep", :estado => "estado", :municipio => "municipio",
                               :latitude => "latitude", :longitude => "longitude", :telefone_1 => "tel1", :telefone_2 => "tel2", :e_mail => "email",
                               :publico_atendido => "publico_atendido", :grupo_especifico => "grupo_especifico", :qual_grupo_especifico	=> "qual_grupo_especifico",
                               :sexo_do_publico => "sexo_do_publico", :modalidade => "modalidade")
      get :show,  id: @clinic.id
      expect(assigns(:clinic).nome).to eq(@clinic.nome)
    end
   end
end