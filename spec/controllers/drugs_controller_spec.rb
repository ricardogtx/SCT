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

  describe "Post /posts => posts#create" do
    it "should create a new drug given valid params" do
      post :create, :drug => {name: "test drugs", description: "test drugs", 
           drug_type: "test drugs", origin: "test drugs", average_ingest: "test drugs",
           ingestion_form: "test drugs", duration: "test drugs", effect_high: "test drugs",
           medical_use: "test drugs", dependence_psychological: "test drugs",
           tolerance: "test drugs", dependence_phisical: "test drugs",
           long_effects: "test drugs"}

      created_drug = Drug.last

      expect(created_drug.description).to eq("test drugs")
      expect(created_drug.name).to eq("test drugs")
      expect(created_drug.origin).to eq("test drugs")
      expect(created_drug.average_ingest).to eq("test drugs")
      expect(created_drug.duration).to eq("test drugs")
      expect(created_drug.effect_high).to eq("test drugs")
      expect(created_drug.dependence_phisical).to eq("test drugs")
      expect(created_drug.dependence_psychological).to eq("test drugs")
      expect(created_drug.tolerance).to eq("test drugs")
      expect(created_drug.long_effects).to eq("test drugs")
      expect(created_drug.drug_type).to eq("test drugs")
      expect(created_drug.medical_use).to eq("test drugs")    
    end

    it "should not create a new drug given invalid params" do
       post :create, :drug => {name: "test drugs", description: "test drugs", 
           drug_type: "test drugs", origin: "test drugs", average_ingest: "test drugs",
           ingestion_form: "test drugs", duration: "test drugs", effect_high: "test drugs",
           medical_use: "test drugs", dependence_psychological: "test drugs",
           tolerance: "test drugs", dependence_phisical: "test drugs",
           long_effects: "test drugs"}

       created_drug = Drug.last

       expect(created_drug.id).not_to eq("test drugs1")
       expect(response).to render_template(:new)
    end
  end

  describe "GET /drugs/new => drugs#new" do
    it "should set @drug with drug new" do 
      get :new

      expect(assigns(:drug)).to be_a(Drug)
      expect(response).to render_template(:new)   
    end  
  end

  describe "GET /drugs/:id/edit => drugs#edit" do
    it "should set @drug if given a valid drug id" do 
      last_drug = Drug.last
      get :edit, :id => last_drug.id

      expect(assigns(:drug)).to be_a(Drug)
      expect(assigns(:drug).name).to eq(last_drug.name)
      expect(assigns(:drug).description).to eq(last_drug.description)
      expect(assigns(:drug).drug_type).to eq(last_drug.drug_type)
      expect(assigns(:drug).origin).to eq(last_drug.origin)
      expect(assigns(:drug).average_ingest).to eq(last_drug.average_ingest)
      expect(assigns(:drug).ingestion_form).to eq(last_drug.ingestion_form)
      expect(assigns(:drug).duration).to eq(last_drug.duration)
      expect(assigns(:drug).effect_high).to eq(last_drug.effect_high)
      expect(assigns(:drug).dependence_phisical).to eq(last_drug.dependence_phisical)
      expect(assigns(:drug).dependence_psychological).to eq(last_drug.dependence_psychological)
      expect(assigns(:drug).tolerance).to eq(last_drug.tolerance)
      expect(assigns(:drug).long_effects).to eq(last_drug.long_effects)
      expect(assigns(:drug).medical_use).to eq(last_drug.medical_use)
      expect(response).to render_template(:edit)   
    end
  end

end
