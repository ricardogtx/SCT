class CampaignsController < ApplicationController

	def new
		@campaign = Campaign.new
	end

	def create
		@campaign = Campaign.new(campaign_params)
		if @campaign.save
			redirect_to campanhas_path, notice: "Criada com sucesso!"
		end
	end

	def index
  		@campaign = Campaign.all
	end

	def destroy
    	@campaign = Campaign.find(params[:id]).destroy
    	redirect_to campanhas_path, notice: "Campanha deletada."
	end

	private
	def campaign_params
		params.require(:campaign).permit(:name, :url, :description)
	end
end