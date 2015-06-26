class State < ActiveRecord::Base
  has_many :clinics


  validates :name, :uf,
            :presence => true,
            :uniqueness           =>  { :case_sensitive => false }

end
