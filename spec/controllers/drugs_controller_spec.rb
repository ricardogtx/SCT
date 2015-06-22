require 'rails_helper'

RSpec.describe DrugsController, type: :controller do
	before :all do
    Drug.create(name: "test drugs", description: "test drugs", drug_type: "test drugs", 
      origin: "test drugs", average_ingest: "test drugs", ingestion_form: "test drugs", 
      duration: "test drugs", effect_high: "test drugs", medical_use: "test drugs", 
      dependence_psychological: "test drugs", tolerance: "test drugs",
      dependence_phisical: "test drugs", long_effects: "test drugs")
    Drug.create(name: "test drugs", description: "test drugs", drug_type: "test drugs", 
      origin: "test drugs", average_ingest: "test drugs", ingestion_form: "test drugs", 
      duration: "test drugs", effect_high: "test drugs", medical_use: "test drugs", 
      dependence_psychological: "test drugs", tolerance: "test drugs",
      dependence_phisical: "test drugs", long_effects: "test drugs")
    Drug.create(name: "test drugs", description: "test drugs", drug_type: "test drugs", 
      origin: "test drugs", average_ingest: "test drugs", ingestion_form: "test drugs", 
      duration: "test drugs", effect_high: "test drugs", medical_use: "test drugs", 
      dependence_psychological: "test drugs", tolerance: "test drugs",
      dependence_phisical: "test drugs", long_effects: "test drugs")
    Drug.create(name: "test drugs", description: "test drugs", drug_type: "test drugs", 
      origin: "test drugs", average_ingest: "test drugs", ingestion_form: "test drugs", 
      duration: "test drugs", effect_high: "test drugs", medical_use: "test drugs", 
      dependence_psychological: "test drugs", tolerance: "test drugs",
      dependence_phisical: "test drugs", long_effects: "test drugs")
  end

  describe "GET /drugs => drugs#index" do
    it "should set @drugs with all drugs" do 
      all_posts = Drug.all

      get :index

      expect(assigns(:drugs)).to match_array(all_posts)   
    end  
  end	  
end
