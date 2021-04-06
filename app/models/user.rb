class User < ActiveRecord::Base

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :password, length: { minimum: 3 }
  validates :password, presence: true
  validates :password_confirmation, presence: true

  has_secure_password


  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email.downcase)
    if  user && user.authenticate(password)
      user
    else
      nil
    end

  end


end