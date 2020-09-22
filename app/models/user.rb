class User < ActiveRecord::Base
  #line of code that gives our User model authentication methods via bcrypt
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, case_sensitive: false, uniqueness: true
  validates :password, :password_confirmation, presence: true, length: {minimum: 3}


  def self.authenticate_with_credentials(email, password)
    
    email = email.strip.downcase
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
  
end
