class Campaign < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  :url
  has_attached_file :avatar, :styles => { :medium => "180x180>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end