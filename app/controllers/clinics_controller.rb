class ClinicsController < ApplicationController
  before_action :set_clinic, only: [:show, :edit, :update, :destroy]

  def index
    @search = Clinic.search(params[:q])
    @clinics = @search.result
  end

  def show
    @clinic = Clinic.find(params[:id])
  end

  def new
    @clinics = Clinic.new
  end

  def update
    @clinic = current_user.clinic
    if @clinic.update_attributes(clinic_params)
      redirect_to :users_profile, notice: 'Dados atualizados com sucesso.'
    else
      render :users_profile_edit
    end
  end

private
  def set_clinic
    @clinics = Clinic.find(params[:id])
  end

  def clinic_params
    params.require(:clinic).permit(:nome, :tipo_logradouro, :nome_logradouro, :numero_logradouro, :complemento, :bairro, :cep, :estado, :municipio,
                                   :latitude, :longitude, :telefone_1, :telefone_2, :e_mail, :publico_atendido, :grupo_especifico,
                                   :qual_grupo_especifico, :sexo_do_publico, :modalidade)
  end

end
