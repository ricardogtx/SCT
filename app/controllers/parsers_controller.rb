class ParsersController < ApplicationController

  def import
    Clinic.import(params[:file])
    redirect_to root_path, notice:  "CSV importado com sucesso"
  end

  def parser_params
      params.require(:clinica).permit(:nome, :endereco, :complemento, :municipio, :cep, :latitude, :longitude, :telefone1, :telefone2, :mail, :publico, :publico_especifico, :sexo_publico, :modalidade)
    end
end
