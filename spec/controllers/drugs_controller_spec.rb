require 'rails_helper'

RSpec.describe DrugsController, type: :controller do
  describe "GET / => drugs#index  " do
    it "should set @drugs with attributes of model Drug" do
      all_data = Drug.all

      get :index

      expect(assigns(:drugs)).to match_array(all_data)
     end
   end

   describe 'GET show' do
    it 'should show drug' do
      @drug = Drug.create!(:name => "nicotine", :drug_type => "cachimbo", :origin => "folhas de tabaco",
                           :average_ingest => "variável", :ingestion_form => "inalável",
                           :effect_average => "relaxamento", :duration => "2-4horas", :effect_high => "dor de cabeça",
                           :dependence_psychological => "alto", :dependence_phisical => "alto", :tolerance => "sim",
                           :medical_use => "nenhuma")
      get :show,  id: @drug.id
      expect(assigns(:drug).name).to eq(@drug.name)
    end
   end
end
