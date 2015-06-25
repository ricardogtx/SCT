class User < ActiveRecord::Base
  has_one :clinic

  before_save :encrypt_password

  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :name,    :presence   =>  true,
            :length               =>  { :maximum => 50 }

  validates :email,   :presence   =>  true,
            :format               =>  { :with => email_regex },
            :uniqueness           =>  { :case_sensitive => false }

  has_secure_password

  validates :password, :presence  =>  true,
            :confirmation         =>  true,
            :length               =>  { :within => 6..40 },
            :allow_blank          =>  true

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate (email, submitted_password)
    user = find_by_email(email)

    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def authenticate_user? (user)
    return user.user_authenticate
  end

  def authenticate_clinic_user? (user)
    return user.clinic
  end

  def authenticate_admin_user? (user)
    return user.level_user
  end

  private
    def encrypt_password
      # generate a unique salt if it's a new user
      self.salt = Digest::SHA2.hexdigest("#{Time.now.utc}--#{password}") if self.new_record?

      # encrypt the password and store that in the encrypted_password field
      self.encrypted_password = encrypt(password)
    end

    def encrypt(pass)
      Digest::SHA2.hexdigest("#{self.salt}--#{pass}")
    end
end
