require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "Get #Home" do
    it "Should be index home" do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
