require 'rails_helper'

RSpec.describe ClinicsController, type: :controller do
  describe "GET / => clinics#index" do
    it "should set @clinics with attributes of clinics parser" do
      all_data = Clinic.all

      get :index

      expect(assigns(:clinics)).to match_array(all_data)
     end
   end
end