class SessionsController < ApplicationController
  def new
  end
  
  def create
    #Gets user from database in lowercase & determines if user is valid
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      redirect_to user
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination' 
      render 'new'
    end
  end
  
  # Logs out the current user.
  def destroy
    log_out # undefined variable
    redirect_to root_url
  end
end