class Question < ActiveRecord::Base
	validates :content, presence: true
	validates :points, presence: true
	:answer
end