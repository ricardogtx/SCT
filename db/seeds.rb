# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
    cont = 1

    dataDrug = YAML::load_file(File.join(Rails.root,"public/static/drugs.yml"))
    dataDrug.each do |data|

    drug = Drug.new

    drug.avatar = File.open(File.join(Rails.root, "app/assets/images/#{cont}.jpg"), "r")
    drug.name = data["Nome"]
    drug.description = data["Descricao"]
    drug.drug_type = data["Tipo_droga"]
    drug.origin = data["Origem"]
    drug.average_ingest = data["Quantidade_media_ingerida"]
    drug.ingestion_form = data["Forma_ingestao"]
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

    cont = cont + 1
    end


    campaign = Campaign.new

    campaign.name = "Anti drogas"
    campaign.url = 'http://www.antidrogas.com.br/'
    campaign.description = "O Site Antidrogas é um site independente, que teve
    início em Agosto de 2000 com a proposta de conscientização sobre os males causados pelas drogas.
    O site Antidrogas surgiu na busca do desenvolvimento de um projeto social que pudesse levar ajuda as
    pessoas utilizando a internet. Objetivando assim levar informações de como as drogas afetam o organismo
    e prejudicam a saúde."
    campaign.avatar = File.open(File.join(Rails.root, "app/assets/images/anti-drogas.jpg"), "r")

    puts "="*80, "Saving: #{campaign.name}", "="*80
    campaign.save!

    campaign = Campaign.new

    campaign.name = "Uniad"
    campaign.url = 'http://www.uniad.org.br/'
    campaign.description = "O Uniad (Unidade de Pesquisas em Álcool e Drogas)
    tem como missão, coordenar um conjunto de ações de natureza preventiva, assistencial, de pesquisa,
    de intervenções comunitárias e de debate público que contribuirão para a definição das políticas de
    controle da dependência e do uso nocivo do álcool e outras drogas no Brasil. Tendo compromisso e
    engajamento profissional, respeitando as características das pessoas, dentro de um ambiente cooperativo."
    campaign.avatar = File.open(File.join(Rails.root, "app/assets/images/uniad.jpg"), "r")

    puts "="*80, "Saving: #{campaign.name}", "="*80
    campaign.save!

    campaign = Campaign.new

    campaign.name = "Contra drogas"
    campaign.url = 'http://www.contradrogas.org.br/'
    campaign.description = "Fundada em 1996, a Associação Parceria Contra Drogas
    é uma ONG sem fins lucrativos, constituída por vários empresários da iniciativa privada, que tem como
    missão aumentar a consciência da população sobre os riscos e conseqüências do uso de droga ilícitas,
    através da divulgação de campanhas educativas de caráter preventivo."
    campaign.avatar = File.open(File.join(Rails.root, "app/assets/images/cad6.jpg"), "r")

    puts "="*80, "Saving: #{campaign.name}", "="*80
    campaign.save!

    campaign = Campaign.new

    campaign.name = "OBID"
    campaign.url = 'http://www.obid.senad.gov.br/portais/OBID/index.php'
    campaign.description = " O Observatório Brasileiro de Informações sobre
    Drogas é uma estrutura de gestão do conhecimento, vinculada a Secretaria Nacional de Políticas sobre
    Drogas - Senad, que tem como missão possibilitar a reunião, a manutenção e a análise de dados referentes
    a drogas lícitas e ilícitas, que permitam estabelecer e gerenciar uma rede de conhecimentos sobre o uso
    indevido de drogas, oferecendo informações oportunas e confiáveis."
    campaign.avatar = File.open(File.join(Rails.root, "app/assets/images/logo_obid.png"), "r")

    puts "="*80, "Saving: #{campaign.name}", "="*80
    campaign.save!

    campaign = Campaign.new

    campaign.name = "Destrave"
    campaign.url = 'http://destrave.cancaonova.com/drogas-um-problema-noss/'
    campaign.description = " O ‘Destrave’ é um projeto da Canção Nova com
    produção de reportagens especiais sobre temas voltados para a juventude, lançado em maio de 2011.
    Parceria entre a produção do Portal Canção Nova, o programa “Revolução Jesus”, a WebTVCN, Departamento
    de Jornalismo CN e a Rádio Canção Nova FM, a iniciativa tem a missão de levar formação e informação
    aos jovens propondo um jeito diferente de ver o mundo."
    campaign.avatar = File.open(File.join(Rails.root, "app/assets/images/cad2.jpg"), "r")

    puts "="*80, "Saving: #{campaign.name}", "="*80
    campaign.save!

    campaign = Campaign.new

    campaign.name = "Cartilha sobre tabaco"
    campaign.url = "http://www.obid.senad.gov.br/portais/OBID/biblioteca/documentos/Publicacoes/cartilhas/Sem_Logo/329743.pdf"
    campaign.description = "Fumar é um hábito muito difundido no Brasil e em todo o mundo, portanto, é
    importante conhecer nao apenas as causas disso, como também as consequências para a saúde individual e
    coletiva. Os dados apresentados nesta cartilha podem ser um bom motivo para você refletir antes de
    acender seu primeiro cigarro. Ou quem sabe, apagar o último de sua vida."
    campaign.avatar = File.open(File.join(Rails.root, "app/assets/images/cartilha-sobre-o-tabaco-1-728.jpg"), "r")

    puts "="*80, "Saving: #{campaign.name}", "="*80
    campaign.save!

    campaign = Campaign.new

    campaign.name = "Cartilha para pais de crianças"
    campaign.url = "http://www.obid.senad.gov.br/portais/OBID/biblioteca/documentos/Publicacoes/cartilhas/Sem_Logo/329742.pdf"
    campaign.description = "Essa cartilha é dirigida a pais de crianças e tem o objetivo de sugerir
    atitudes que podem ser adotadas na educação dos filhos para que, mais tarde, eles tenham poucas
    chances de virem a abusar de álcool, cigarros e outras drogas. Por isso, os pais têm influência
    fundamental no desenvolvimento de comportamentos, emoções e habilidades, seja através do próprio
    exemplo, seja por serem capazes de propiciar experiências positivas e minimizar algumas experiências
    negativas impossíveis de serem evitadas."
    campaign.avatar = File.open(File.join(Rails.root, "app/assets/images/drogas-cartilha-para-pais-de-crianas-1-728.jpg"), "r")

    puts "="*80, "Saving: #{campaign.name}", "="*80
    campaign.save!

    campaign = Campaign.new

    campaign.name = "Cartilha sobre álcool e jovens"
    campaign.url = "http://www.obid.senad.gov.br/portais/OBID/biblioteca/documentos/Publicacoes/cartilhas/Sem_Logo/329744.pdf"
    campaign.description = "Esta cartilha procura explicar os vários aspectos envolvidos no consumo de
    bebidas alcoólicas, trazendo dados nem sempre disponíveis em outras fontes. Discutindo o uso de
    bebidas alcoólicas para informar os jovens, ajudando a desfazer mitos, oferecendo dicas e fazendo
    algumas sugestões sobre maneiras de diminuir os riscos associados ao consumo de álcool.
    Espera-se que de posse dessas informações, seja possível entender melhor as consequências de suas
    decisões e, sobretudo, assumir a responsabilidade pelas ações relacionadas ao consumo de álcool."
    campaign.avatar = File.open(File.join(Rails.root, "app/assets/images/cartilha-alcool-e-jovens-1-728.jpg"), "r")

    puts "="*80, "Saving: #{campaign.name}", "="*80
    campaign.save!

    campaign = Campaign.new

    campaign.name = "Cartilha mudando comportamentos"
    campaign.url = "http://www.obid.senad.gov.br/portais/OBID/biblioteca/documentos/Publicacoes/cartilhas/Sem_Logo/329740.pdf"
    campaign.description = "Esse caderno de atividades é destinado a todos aqueles que estão um pouco,
    ou muito, incomodados com o seu próprio consumo de alguma substância, seja bebida, cigarros, maconha,
    calmantes, cocaína ou outras substâncias.  Ele é seu aliado numa jornada que requer muita coragem e
    planejamento. As atividades aqui contidas têm como objetivo levá-lo a um melhor entendimento de seus
    próprios desejos e, caso seja a sua decisão, auxiliá-lo a elaborar um plano de mudança. Um plano com
    seu jeito, uma resposta para aquilo que você sente que o incomoda ou prejudica. Este caderno servirá
    como apoio para melhor entender a si próprio, o ambiente em que vive, as barreiras que vêm encontrando
    para mudar e possíveis maneiras de vencê-las."
    campaign.avatar = File.open(File.join(Rails.root, "app/assets/images/cartilha-mudando-comportamentosweb-1-728.jpg"), "r")

    puts "="*80, "Saving: #{campaign.name}", "="*80
    campaign.save!

    campaign = Campaign.new

    campaign.name = "Cartilha sobre maconha, cocaína e inalantes"
    campaign.url = "http://www.obid.senad.gov.br/portais/OBID/biblioteca/documentos/Publicacoes/cartilhas/Sem_Logo/329738.pdf"
    campaign.description = "Todas as informações apresentadas nesta cartilha têm fundamento em pesquisas
    e estudos científicos e podem ajudar a refletir sobre os nossos comportamentos e a avaliar os riscos
    a eles associados. Ter liberdade não significa poder fazer aquilo que queremos, a qualquer hora, mas
    ter consciência dos efeitos e consequências de nossos atos para poder tomar decisões responsáveis."
    campaign.avatar = File.open(File.join(Rails.root, "app/assets/images/cartilha-maconha-cocainainalantes-1-728.jpg"), "r")

    puts "="*80, "Saving: #{campaign.name}", "="*80
    campaign.save!

    campaign = Campaign.new

    campaign.name = "Cartilha para educadores"
    campaign.url = "http://www.obid.senad.gov.br/portais/OBID/biblioteca/documentos/Publicacoes/cartilhas/Sem_Logo/329739.pdf"
    campaign.description = "Educadores de ensino fundamental e médio são, cada vez mais, cobrados pelos
    pais de alunos, direção da escola e pela opinião pública para abordarem a questão das drogas em sala
    de aula, e para saberem lidar de modo efetivo com alunos que necessitam atenção especial nessa questão.
    Esta cartilha se propõe a oferecer subsídios teóricos e práticos para os esforços sejam mais alinhados
    com o que as pesquisas científicas têm apontado como mais eficaz no campo da prevenção do consumo de
    drogas na escola."
    campaign.avatar = File.open(File.join(Rails.root, "app/assets/images/drogas-cartilha-para-educadores-1-728.jpg"), "r")

    puts "="*80, "Saving: #{campaign.name}", "="*80
    campaign.save!

    campaign = Campaign.new

    campaign.name = "Cartilha para pais de adolescentes"
    campaign.url = "http://www.obid.senad.gov.br"
    campaign.description = "Essa cartilha visa orientar pais de adolescentes e oferecer informações e
    orientações para ajudá-los a transformar a energia muitas vezes consumida pela ansiedade, em
    iniciativas produtivas que contribuam para que os riscos de seus filhos terem problemas com bebidas
    alcoólicas, cigarro e outras drogas sejam minimizadas"
    campaign.avatar = File.open(File.join(Rails.root, "app/assets/images/paisdeadolescentes.png"), "r")

    puts "="*80, "Saving: #{campaign.name}", "="*80
    campaign.save!

    campaign.name = "Ligue 132"
    campaign.url = nil
    campaign.description = "Ligue 132 é um serviço do programa “Crack, é possível
    vencer” para auxiliarem os pais a conversarem com os seus filhos sobre os efeitos das drogas. É composta
    por uma equipe de consultores treinada para auxiliarem familiares e acolherem da melhor forma,
    respondendo a dúvidas e respondendo sobre como se comportar em momentos difíceis. O objetivo do serviço
    é evitar que os jovens tenham contato com as drogas. Funciona 24 horas por dia, 7 dias da semana
    (inclusive feriados) e o atendimento é gratuito e sigiloso."
    campaign.avatar = File.open(File.join(Rails.root, "app/assets/images/logo_ligue_1.png"), "r")

    puts "="*80, "Saving: #{campaign.name}", "="*80
    campaign.save!

    campaign = Campaign.new

    campaign.name = "Viva voz"
    campaign.url = nil
    campaign.description = "O VIVAVOZ é uma central telefônica de orientações e
    informações sobre a prevenção do uso indevido de drogas. O telefonema é gratuito e o atendimento é
    sigiloso. A pessoa não precisa se identificar. O VIVAVOZ é resultado de uma parceria entre a Secretaria
    Nacional de Políticas sobre Drogas - SENAD, a Universidade Federal de Ciências de Saúde de Porto Alegre
    e o Programa Nacional de Segurança Pública com Cidadania (PRONASCI), do Ministério da Justiça."
    campaign.avatar = File.open(File.join(Rails.root, "app/assets/images/vivavoz-logo.jpg"), "r")

    puts "="*80, "Saving: #{campaign.name}", "="*80
    campaign.save!

    campaign = Campaign.new

    User.create! :name=>"Admin", :email=>"admin@email.com", :password=>"123456", :password_confirmation=>"123456", :level_user=>1, :user_authenticate=>1

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