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

	def counter_total
		@question = Question.all
		@question.each do |question|
			@total += question.points
		end
	end

	def counter_user
		@question = Question.find(params[:id])
		@pquestion = Question.find(@question.id - 1)
		@user_points = @user_points + @question.points
	end

	def show
  		@question = Question.find(params[:id])
  		if !@question.answer.nil?
  			@question.update_attribute(:answer, nil)
  			redirect_to "/questions/#{@question.id + 1}" unless @question == Question.last
  			if @question == Question.last
  				@questions = Question.all
  				@questions.each do |q|
  					if q.answer
  					end
  					q.update_attribute(:answer, nil)
  				end
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

	def match_answer
		@question = Question.find(params[:id])
		if @question.update(question.answer)
			@question.counter_total
			if @question.answer
				@question.counter_user
			end
		end
	end

	private
	def question_params
		params.require(:question).permit(:content, :points, :answer)
	end
end