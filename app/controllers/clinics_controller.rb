class ClinicsController < ApplicationController
  before_action :set_clinic, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => [:id_of_city]

  def index 
    @search = Clinic.search(params[:q])
    @clinics = @search.result.paginate(:page => params[:page]).per_page(20)
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
      redirect_to :users, notice: 'Dados atualizados com sucesso.'
    else
      render :users_clinic_edit
    end
  end

  def id_of_city
    state = State.find_by_uf(params[:uf])

    if request.xhr?
      render :json => {city_id: state.id}
    end
  end

private
  def set_clinic
    @clinics = Clinic.find(params[:id])
  end

  def clinic_params
    params.require(:clinic).permit(:nome, :tipo_logradouro, :nome_logradouro, :numero_logradouro, :complemento, :bairro, :cep, :state_id, :municipio,
                                   :latitude, :longitude, :telefone_1, :telefone_2, :e_mail, :publico_atendido, :grupo_especifico,
                                   :qual_grupo_especifico, :sexo_do_publico, :modalidade)
  end

  def state_params
    params.require(:state).permit(:name, :uf)
  end

end
