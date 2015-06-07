class CampaignsController < ApplicationController

	def new
		@campaign = Campaign.new
	end

	def index
  		@campaign = Campaign.all
	end

	def create
		@campaign = Campaign.new(campaign_params)
		if @campaign.save
			redirect_to campanhas_path, notice: "Enviado com sucesso."
		end
	end

	def destroy
	end
end