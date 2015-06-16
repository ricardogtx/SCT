require 'rails_helper'

RSpec.describe CampaignsController, type: :controller do 

	before :each do
		@campaign = Campaign.new
		@campaign.name = "campaign"
		@campaign.url = "/campaign"
		@campaign.description = "A campaign"
	end

	describe 'GET #new' do
		it "must have a description" do
			@campaign.description = ""
			expect(@campaign).not_to be_valid
		end

		it "must have a url" do
			@campaign.url = ""
			expect(@campaign).not_to be_valid
		end

		it "must have a name" do
			@campaign.name = ""
			expect(@campaign).not_to be_valid
		end

		it "should create a new campaign" do
			expect(@campaign).to be_a(Campaign)
		end
	end

	describe 'POST #create' do
		it "should redirect to show with a notice on successfull save" do
			expect{
				post :create, :campaign => {:name => 'RSPEC', :url => 'RSpec', :description => 'RSpec'}
			}.to change(Campaign, :count).by(1)
			expect(response).to redirect_to(campanhas_path)
			expect(flash[:notice]).not_to be_nil
		end
	end

	describe 'GET #index' do
		it 'should render the index page' do
			get :index
			expect(response).to render_template(:index)
		end
	end

	describe 'GET #show' do
		it 'should render the show page' do
		
			@campaign.save
			get :show, id: @campaign.id
			expect(response).to render_template(:show)
		end
	end

	describe 'GET #edit' do
		it 'should render the edit page if campaign is not nil' do
			@campaign.save
			get :edit, id: @campaign.id
			expect(response).to render_template(:edit)
		end
	end

	describe 'PATCH #update' do
		it 'should edit a campaign, and then redirect to campaigns with a succesfull notice' do
			@campaign.save
			patch :update, id: @campaign.id, campaign: {:name => 'test campaign', :url => '/test_campaign', :description => 'A test campaign'}
			@campaign.reload
			expect(@campaign.name).to eq('test campaign')
			expect(@campaign.url).to eq('/test_campaign')
			expect(@campaign.description).to eq('A test campaign')
			expect(flash[:notice]).not_to be_nil
		end
	end

	describe 'DELETE #destroy' do
		it 'should delete a campaign from the database and redirect to campaigns page with a successfull notice' do
			@campaign.save
			expect { delete :destroy, id: @campaign.id
			}.to change(Campaign, :count).by(-1)
			expect(response).to redirect_to(campanhas_path)
			expect(flash[:notice]).not_to be_nil
		end
	end

end