class Campaign < ActiveRecord::Base
	validates :name, presence: true
	validates :url, presence: true
	validates :description, presence: true
end