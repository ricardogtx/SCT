require 'rails_helper'

RSpec.describe CampaignsController, type: :controller do 

	before :all do
		@campaign = Campaign.new
	end

	describe 'GET #new' do
		it "must have a description" do
			@campaign.name = "abcd"
			@campaign.url = "asdasdasd"
			@campaign.description = ""
			expect(@campaign).not_to be_valid
		end

		it "must have a url" do
			@campaign.name = "abcd"
			@campaign.url = ""
			@campaign.description = "dcba"
			expect(@campaign).not_to be_valid
		end

		it "must have a name" do
			@campaign.name = ""
			@campaign.url = "asdasdasd"
			@campaign.description = "abc"
			expect(@campaign).not_to be_valid
		end

		it "should create a new campaign" do
				@campaign.name = "dcba"
				@campaign.url = "asdasdasd"
				@campaign.description = "abcd"
			expect(@campaign).to be_a(Campaign)
		end
	end

	describe 'POST #create' do
		it "should redirect to show with a notice on successfull save" do
			expect{
				post :create, :campaign => {:name => 'RSPEC', :url => 'RSpec', :description => 'RSpec'}
			}.to change(Campaign, :count).by(1)
			expect(flash[:notice]).not_to be_blank
			expect(response).to redirect_to(campanhas_path)
		end
	end

end