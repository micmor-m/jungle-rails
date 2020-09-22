class UsersController < ApplicationController
  #new for rendering the signup form
  def new
    @error = false
    @message = ""
    #p "Error from new user controller #{ @error}"
    #p "Message from new user controller #{ @message}"
  end

  #create for receiving the form and creating a user with form's parameter
  def create
    
    #input verification
    #p "This is the user parameter email #{user_params[:email]}"
    @email = user_params[:email]
    
    #if email already present in database
    if exist_email?((user_params[:email]).strip.downcase)
      #p "This email already exist"
      @message = "This email already exist"
      @error = true
      render 'new'
    elsif (user_params[:password] != user_params[:password_confirmation])
      #p "Password and password confirmation are different"
      @message = "Password and password confirmation are different"
      @error = true
      render 'new'
    elsif (user_params[:password].length < 3)
      #p "Password and password confirmation are different"
      @message = "Password must be at least 3 char. long"
      @error = true
      render 'new'
    elsif ((user_params[:first_name] === '') || (user_params[:last_name] === ''))
      #p "Please fill-in all fields"
      @message = "Please fill-in all fields"
      @error = true
      render 'new'
    else
    #raise myuser.inspect
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        redirect_to '/'
      else
        redirect_to '/signup'
      end
    end
  end

  def exist_email?(current_email)
    # User.exist.any?
    @user_exsist = User.where("users.email = ?", current_email).any?
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
