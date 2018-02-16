class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: 'Logged in!'
    else
      flash.now.alert = 'Email or password is invalid'
      render :new
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to '/users', notice: 'Logged out!'
  end
end
