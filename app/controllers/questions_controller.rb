class QuestionsController < ApplicationController

	def new
		@question = Question.new
	end

	def create
		@question = Question.new(question_params)
		if @question.save
			redirect_to :action => 'show', :id => @question.id, notice: "Criado com sucesso!"
		end
	end

	def result
		@question = Question.last
		if @question.counter < 0.5 * @question.id 
		  flash[:notice] = "Constatou-se que o usúario avaliado não é um possível usuário de drogas"
		else
		  flash[:notice] = "Constatou-se que o usúario avaliado é um possível usuário drogas"
		end
	end

	def show
  		@question = Question.find(params[:id])
  		if !@question.answer.nil?
  			redirect_to "/questions/#{@question.id + 1}" unless @question == Question.last
  			if @question == Question.last
  				@question.update_attribute(:counter, nil)
  				@questions = Question.all
  				@questions.each do |question|
  					if question.answer
  						@question.increment!(:counter, by = 1)
  					end
  					question.update_attribute(:answer, nil)
  				end
  				redirect_to "/resultados"
  			end
		end
	end

	def index
		@question = Question.all
	end

	def edit
		@question = Question.find params[:id]
   		redirect_to "/question" unless @question
  	end	

	def update
	    @question = Question.find params[:id]
    	if @question.update_attributes(question_params)
			redirect_to question_path(@question), :notice => "Questão atualizada."
    	else
    	  render "edit"
    	end  	
	end

    def destroy
    	@question = Question.find(params[:id]).destroy
    
    	redirect_to questions_path, notice: "Questão deletada."
	end

	private
	def question_params
		params.require(:question).permit(:content, :answer)
	end
	
end