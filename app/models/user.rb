require 'bcrypt'

class User < ActiveRecord::Base
  
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation

  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :name,    :presence   =>  true,
            :lenght               =>  { :maximum => 50 }
  
  validates :email,   :presence   =>  true,
            :format               =>  { :with => email_regex },
            :uniqueness           =>  { :case_sensitive => false }

  validates :password, :presence  =>  true,
            :confirmation         =>  true,
            :lenght               =>  { :within => 6..40 }

end
