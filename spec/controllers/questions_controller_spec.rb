require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

	before :all do
		@test_question = Question.new
	end

	describe 'GET #new' do
		it "must have content" do
			@test_question.content = ""
			expect(@test_question).not_to be_valid
		end

		it "creates a new question" do
				@test_question.content = "TEST"
				expect(@test_question).to be_a(Question)
		end
	end

	describe "GET #index" do
    	it "assigns @question" do
    		get :index
    		response.should be_success
     	end

     	it "displays index page" do
     		get :index
     		expect(response).to render_template("index")
     	end
	end

	describe 'POST #create' do
		it "should redirect to index with a notice on successfull save" do
			expect{
				post :create, :question => {:content => 'RSPEC'}
			}.to change(Question, :count).by(1)
			expect(flash[:notice]).not_to be_blank
			expect(response).to redirect_to(questions_path)
		end
	end

	# describe 'GET #result' do
	# 	it "shows a low amount of points due to low counter" do
	# 		@last_question = Question.last
	# 		@last_question.counter = 0
	# 		get :result, :id => @last_question.id
	# 		expect(flash[:notice]).not_to be_blank
	# 		expect(response).to render_template("result")
	# 	end
	#
	# 	it "shows a low amount of points due to nil counter" do
	# 		@last_question = Question.last
	# 		get :result, :id => @last_question.id
	# 		expect(flash[:notice]).not_to be_blank
	# 		expect(response).to render_template("result")
	# 	end
	#end
end
