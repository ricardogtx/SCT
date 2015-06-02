class Testimonial < ActiveRecord::Base
	validates :body, presence: true, length: { maximum: 2000 }
	validates :title, presence: true

end
