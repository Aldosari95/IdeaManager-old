class SessionsController < ApplicationController
  skip_before_action :authenticate
  def new
  end

  def create
    user = User.find_by(email:
    params[:sessions][:email].downcase)
    if  user && user.authenticate(params[:sessions][:password])
      log_in user
      flash[:notice] = 'Logged in'
      redirect_to root_path
    else
      flash.now[:alert] = 'Invalid email/password'
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:notice] = 'Logged out'
    redirect_to root_path
  end

end
