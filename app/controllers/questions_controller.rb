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

	def show
    	@question = Question.find(params[:id])
	end

	def index
  		@questions = Question.all
	end

	def edit
      @question = Question.find params[:id]

      redirect_to "/question" unless @question
    end

    def update
      @question = Question.find params[:id]

      if @question.update_attributes(question_params)
      	redirect_to questions_path, :notice => "Questão atualizada."
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
		params.require(:question).permit(:content, :points)
	end
end