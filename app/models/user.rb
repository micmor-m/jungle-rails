class User < ActiveRecord::Base
  #line of code that gives our User model authentication methods via bcrypt
  has_secure_password

  authenticate_with_credentials(email, password)
    #params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    p "email #{email}"
    p "password #{password}"
  end
  
end
