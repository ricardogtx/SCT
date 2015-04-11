class CreateClinics < ActiveRecord::Migration
  def change
    create_table :clinics do |t|
      t.string "nome"
      t.string "tipo_logradouro"
      t.string "nome_logradouro"
      t.string "numero_logradouro"
      t.string "complemento"
      t.string "bairro"
      t.string "cep"
      t.string "estado"
      t.string "municipio"
      t.float "latitude"
      t.float "longitude"
      t.string "telefone_1"
      t.string "telefone_2"
      t.string "e_mail"
      t.string "publico_atendido"
      t.string "grupo_especifico"
      t.string "qual_grupo_especifico"
      t.string "sexo_do_publico"
      t.string "modalidade"

      t.timestamps null: false
    end
  end
end
