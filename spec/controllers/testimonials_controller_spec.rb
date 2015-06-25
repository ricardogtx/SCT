require 'rails_helper'

RSpec.describe TestimonialsController, type: :controller do 

	before :all do
	  
	  User.destroy_all
	  User.create! :id=>1, :name=>"vitor", :email=>"vitor.nere@hotmail.com", :password=>"123456", :password_confirmation=>"123456", :user_authenticate=>1
	  Testimonial.create(title: "test drugs", body: "test drugs", testimonial_authenticate: 1)
	  Testimonial.create(title: "test drugs", body: "test drugs", testimonial_authenticate: 1)
	  Testimonial.create(title: "test drugs", body: "test drugs", testimonial_authenticate: 1)
	  Testimonial.create(title: "test drugs", body: "test drugs", testimonial_authenticate: 1)	
      @testimonial = Testimonial.new
	end

	describe "GET /testimonials/new => testimonials#new" do
      it "should set @testimonial with drug new" do 
        get :new

        expect(assigns(:testimonial)).to be_a(Testimonial)
        expect(response).to render_template(:new)   
      end  
    end

    describe "GET /testimonials/:id/edit => testimonials#edit" do
    it "should set @testimonial if given a valid testimonial id" do 
      user = User.last
      user.update_attributes(:level_user => 1)
      session[:user_id] = User.last.id

      last_testimonial = Testimonial.last
      get :edit, :id => last_testimonial.id

      expect(assigns(:testimonial)).to be_a(Testimonial)
      expect(assigns(:testimonial).body).to eq(last_testimonial.body)
      
      expect(response).to redirect_to(:admin)   
    end
  end

  describe "PATCH /testimonials/:id => testimonials#update" do
      it "should update a testimonial if given authentication testimonials params" do
	      user = User.last
	      user.update_attributes(:level_user => 1)
	      session[:user_id] = User.last.id 

	      last_testimonial = Testimonial.last
	      last_testimonial.update_attributes(:testimonial_authenticate => nil)

	      patch :update, :id => last_testimonial.id, :testimonial => {
	           title: "test testimonials", body: "test testimonials"}

	      expect(assigns(:testimonial)).to be_a(Testimonial)
	      expect(assigns(:testimonial).title).to eq("test testimonials")
	      
        expect(response).to redirect_to(:admin)
	      expect(flash[:notice]).not_to be_nil

      end

      it "should update a testimonial if given authentication testimonials params" do
	      user = User.last
	      user.update_attributes(:level_user => 1)
	      session[:user_id] = User.last.id 

	      last_testimonial = Testimonial.last

	      patch :update, :id => last_testimonial.id, :testimonial => {
	           title: "test testimonials", body: "test testimonials" }

	      expect(assigns(:testimonial)).to be_a(Testimonial)
	      expect(assigns(:testimonial).testimonial_authenticate).to eq(1)
	    
	      expect(flash[:notice]).not_to be_nil
      end
    end

    describe "DELETE /testimonials/:id => testimonials#destroy" do
      it "should delete a testimonial if given its id" do 
        user = User.last
        user.update_attributes(:level_user => 1)
        session[:user_id] = User.last.id

        last_testimonial = Testimonial.last

        delete :destroy, :id => last_testimonial.id

        expect(last_testimonial.id).to eq(last_testimonial.id)
        expect(flash[:notice]).not_to be_nil
        expect(response).to redirect_to(:admin) 
      end

      it "Should desconect if user not admin" do 
        user = User.last
        session[:user_id] = User.last.id

        last_testimonial = Testimonial.last

        delete :destroy, :id => last_testimonial.id

       	expect(response).to redirect_to(:logout) 
      end
    end

    describe "GET /testimonials => testimonials#index" do
      it "should set @testimonials with all testimonials" do 
        all_testimonials = Testimonial.all

        get :show

        expect(assigns(:testimonial)).to match_array(all_testimonials)   
      end  
    end 

	describe 'POST #create' do
		it "should redirect to show with a notice on successfull save" do
			expect{
				post :create, :testimonial => {:title => 'RSPEC', :body => 'RSpec'}
			}.to change(Testimonial, :count).by(1)
			expect(flash[:notice]).not_to be_blank
			expect(response).to redirect_to(depoimentos_path)
		end
	end
end