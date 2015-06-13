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

	private
	def question_params
		params.require(:question).permit(:content, :points)
	end
end