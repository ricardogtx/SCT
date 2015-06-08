class CampaignsController < ApplicationController

	def new
		@campaign = Campaign.new
	end

	def create
		@campaign = Campaign.new(campaign_params)
		if @campaign.save
			redirect_to :action => 'show', :id => @campaign.id
			#redirect_to campanhas_path, notice: "Criada com sucesso!"
		end
	end

	def show
    	@campaign = Campaign.find(params[:id])
	end

	def index
  		@campaigns = Campaign.all
	end

	def destroy
    	@campaign = Campaign.find(params[:id]).destroy
    	redirect_to campanhas_path, notice: "Campanha deletada."
	end

	private
	def campaign_params
		params.require(:campaign).permit(:name, :url, :description, :avatar)
	end
end