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

    campaign = Campaign.new

    campaign.name = "Cartilha sobre tabaco"
    campaign.url = "http://www.obid.senad.gov.br/portais/OBID/biblioteca/documentos/Publicacoes/cartilhas/Sem_Logo/329743.pdf"
    campaign.description = "Cartilha sobre o tabaco e seus riscos."
    campaign.avatar = File.open(File.join(Rails.root, "app/assets/images/cartilha-sobre-o-tabaco-1-728.jpg"), "r")

    puts "="*80, "Saving: #{campaign.name}", "="*80
    campaign.save!

    campaign = Campaign.new

    campaign.name = "Cartilha para pais de crianças"
    campaign.url = "http://www.obid.senad.gov.br/portais/OBID/biblioteca/documentos/Publicacoes/cartilhas/Sem_Logo/329742.pdf"
    campaign.description = "Cartilha de auxilio aos pais sobre educação infantil."
    campaign.avatar = File.open(File.join(Rails.root, "app/assets/images/drogas-cartilha-para-pais-de-crianas-1-728.jpg"), "r")

    puts "="*80, "Saving: #{campaign.name}", "="*80
    campaign.save!

    campaign = Campaign.new

    campaign.name = "Cartilha sobre álcool e jovens"
    campaign.url = "http://www.obid.senad.gov.br/portais/OBID/biblioteca/documentos/Publicacoes/cartilhas/Sem_Logo/329744.pdf"
    campaign.description = "Cartilha educacional sobre o combate ao álcool."
    campaign.avatar = File.open(File.join(Rails.root, "app/assets/images/cartilha-alcool-e-jovens-1-728.jpg"), "r")

    puts "="*80, "Saving: #{campaign.name}", "="*80
    campaign.save!

    campaign = Campaign.new

    campaign.name = "Cartilha mudando comportamentos"
    campaign.url = "http://www.obid.senad.gov.br/portais/OBID/biblioteca/documentos/Publicacoes/cartilhas/Sem_Logo/329740.pdf"
    campaign.description = "Cartilha de auxilio à mudança de hábito."
    campaign.avatar = File.open(File.join(Rails.root, "app/assets/images/cartilha-mudando-comportamentosweb-1-728.jpg"), "r")

    puts "="*80, "Saving: #{campaign.name}", "="*80
    campaign.save!

    campaign = Campaign.new
    
    campaign.name = "Cartilha sobre maconha, cocaína e inalantes"
    campaign.url = "http://www.obid.senad.gov.br/portais/OBID/biblioteca/documentos/Publicacoes/cartilhas/Sem_Logo/329738.pdf"
    campaign.description = "Cartilha educacional sobre os perigos de diversas drogas."
    campaign.avatar = File.open(File.join(Rails.root, "app/assets/images/cartilha-maconha-cocainainalantes-1-728.jpg"), "r")

    puts "="*80, "Saving: #{campaign.name}", "="*80
    campaign.save!

    campaign = Campaign.new
    
    campaign.name = "Cartilha para educadores"
    campaign.url = "http://www.obid.senad.gov.br/portais/OBID/biblioteca/documentos/Publicacoes/cartilhas/Sem_Logo/329739.pdf"
    campaign.description = "Cartilha de auxílio a educadores contra as drogas."
    campaign.avatar = File.open(File.join(Rails.root, "app/assets/images/drogas-cartilha-para-educadores-1-728.jpg"), "r")

    puts "="*80, "Saving: #{campaign.name}", "="*80
    campaign.save!

    campaign = Campaign.new
    
    campaign.name = "Cartilha para pais de adolescentes"
    campaign.url = "http://www.obid.senad.gov.br"
    campaign.description = "Cartilha de auxilio aos pais sobre como lidar com a questão das drogas com adolescentes."
    campaign.avatar = File.open(File.join(Rails.root, "app/assets/images/paisdeadolescentes.png"), "r")

    puts "="*80, "Saving: #{campaign.name}", "="*80
    campaign.save!