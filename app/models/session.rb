class Session < ActiveRecord::Base

  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :email,   :presence   =>  true,
            :format               =>  { :with => email_regex },
            :uniqueness           =>  { :case_sensitive => false }

  validates :password, :presence  =>  true,
            :confirmation         =>  true,
            :length               =>  { :within => 6..40 }
end
