class QuestionsController < ApplicationController

	def new
		@question = Question.new
	end

	def create
		@question = Question.new(question_params)
		if @question.save
			flash[:notice] = "Criado com sucesso!"
			redirect_to :action => 'index'
		end
	end

	def result
		@question = Question.last
		if !@question.counter || @question.counter < 0.5 * @question.id
		  flash[:notice] = "Pontuação final baixa, ou seja, o risco de que a pessoa em questão seja um usuário de drogas não é alto."
		else
		  flash[:notice] = "Pontuação final alta, ou seja, existe um risco alto de que a pessoa em questão seja um usuário de drogas."
		  render :pontuacao_alta
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
    	@question = Questionfind params[:id]
    	@question.delete
    	flash[:notice] = "Questão deletada."
    	redirect_to questions_path
	end

	private
	def question_params
		params.require(:question).permit(:content, :answer)
	end
	
end