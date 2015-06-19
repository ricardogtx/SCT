class DrugsController < ApplicationController
  def index
    @drugs = Drug.all
  end

  def show
    @drug = Drug.find params[:id]
  end

  def new
    @drug = Drug.new
  end	

  def create
    @drug = Drug.new(drugs_params)
    
    if @drug.save
	  redirect_to drugs_path, notice: "Criada com sucesso!"
	end  	
  end

  def edit
    @drug = Drug.find params[:id]
  end

  def destroy
    @drug = Drug.find(params[:id]).destroy
    redirect_to drugs_path, notice: "Droga deletada."	
  end

  def update
   @drug = Drug.find params[:id]

    if @drug.update_attributes(drugs_params)
      redirect_to drugs_path, :notice => "Droga foi atualizada"
    else
      render "edit"
    end
  end	

  private
    def drugs_params
      params.require(:drug).permit(:name, :drug_type, :dependence_pysichological, :dependence_phisical, :description, :avatar)
    end	
end
