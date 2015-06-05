class State < ActiveRecord::Base
  has_many :clinics


  validates :name,
            :presence => true,
            :uniqueness           =>  { :case_sensitive => false }

end
