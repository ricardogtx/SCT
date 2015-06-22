# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    dataDrug = YAML::load_file(File.join(Rails.root,"public/static/drugs.yml"))
    dataDrug.each do |data|

    drug = Drug.new

    drug.name = data["Nome"]
    drug.drug_type = data["Tipo_droga"]
    drug.origin = data["Origem"]
    drug.average_ingest = data["Quantidade_media_ingerida"]
    drug.ingestion_form = data["Forma_ingestao"]
    drug.effect_average = data["Efeitos_a_curto_prazo_quantidade_media"]
    drug.duration = data["Duracao"]
    drug.effect_high = data["Efeitos_a_curto_prazo_grandes_quantidades"]
    drug.dependence_psychological = data["Risco_de_dependencia_psicologica"]
    drug.dependence_phisical = data["Risco_de_dependencia_fisica"]
    drug.tolerance = data["Tolerancia"]
    drug.long_effects = data["Efeitos_a_longo_prazo"]
    drug.medical_use = data["Utilizacao_medica"]
    drug.usage_percentage = data["Usage_percentage"]
    drug.death_rate = data["Death_rate"]
    drug.dependency_rate = data["Dependency_rate"]

    puts "="*80, "Saving: #{drug.name}", "="*80
    drug.save!

    end

    question = Question.new

    question.content = "A pessoa em questão anda em companhia de pessoas que usam drogas?"

    question.save!

    question = Question.new

    question.content = "A pessoa em questão possui um humor descontrolado, sendo fácilmente irritável?"

    question.save!

    question = Question.new

    question.content = "A pessoa em questão parece estar frequentemente com os olhos avermelhados, brilhantes, ou faz uso recorrente de colírios?"

    question.save!

    question = Question.new

    question.content = "A pessoa em questão apresentou alguma alteração repentina de peso?"

    question.save!

    question = Question.new

    question.content = "A pessoa em questão passa períodos de tempo irregulares fora de casa?"

    question.save!

    question = Question.new

    question.content = "A pessoa em questão tem apresentado falta de motivação, até com atividades que costumava realizar com dedicação?"

    question.save!

    question = Question.new

    question.content = "A pessoa em questão adquiriu o hábito de mentir com frequência?"

    question.save!

    question = Question.new

    question.content = "A pessoa em questão apresentou uma queda repentina de rendimento, seja no trabalho, seja nos estudos?"

    question.save!

    question = Question.new

    question.content = "A pessoa em questão passou por uma mudança repentina do modo de se vestir ou de seu gosto musical?"

    question.save!

    question = Question.new

    question.content = "A pessoa em questão parece ter trocado o dia pela noite?"

    question.save!