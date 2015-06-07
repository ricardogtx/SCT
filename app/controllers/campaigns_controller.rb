class CampaignsController < ApplicationController

	def new
		@campaign = Campaign.new
	end

	def create
		@campaign = Campaign.new(campaign_params)
		if @campaign.save
			redirect_to campanhas_path, notice: "Enviado com sucesso."
		end
	end

	def index
  		@campaign = Campaign.all
	end

	def destroy
	end

	private
	def campaign_params
		 params.require(:campaign).permit(:name, :url, :description)
	end
end