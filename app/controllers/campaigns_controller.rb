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

	def edit
      @campaign = Campaign.find params[:id]
    end

    def update
      @campaign = Campaign.find params[:id]
      if @campaign.update_attributes(params[:campaign])
        redirect_to :action => 'show', :id => @campaign.id
      end
    end

	private
	def campaign_params
		params.require(:campaign).permit(:name, :url, :description, :avatar)
	end
end