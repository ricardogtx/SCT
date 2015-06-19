class DrugsController < ApplicationController
    def new
		@drug = Drug.new
	end

	def create
		@drug = Drug.new(drug_params)
		if @drug.save
			redirect_to drugs_path, notice: "Criada com sucesso!"
		end
	end

	def show
    	@drug = Drug.find(params[:id])
	end

	def index
      @user = current_user
  		@drugs = Drug.all
	end

	def destroy
    	@drug = Drug.find(params[:id]).destroy
    	redirect_to campanhas_path, notice: "Droga deletada."
	end

	def edit
      @drug = Drug.find params[:id]

      redirect_to "/drugs" unless @drug
    end

    def update
      @drug = Drug.find params[:id]

      if @drug.update_attributes(drug_params)
      	redirect_to drugs_path, :notice => "Droga foi atualizada"
      else
        render "edit"
      end
    end

	private
	def drug_params
		params.require(:drug).permit(:name, :drug_type, :description, :effect, :dependence_physicological, :dependence_phisical)
	end
end

