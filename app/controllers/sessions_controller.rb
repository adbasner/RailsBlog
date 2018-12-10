class SessionsController < ApplicationController
  def new
    render 'new.html.erb'
  end

  def create
    user = User.find_by(username: sessions_params[:username])
    if user && user.authenticate(sessions_params[:password])
      session[:user_id] = user.id
      flash[:success] = ["#{user.username} is logged in!"]
      redirect_to user_path(user)
      # "/users/#{user.id}"
    else
      flash.now[:warning] = ['Wrong user name or password']
      render 'new'
      # render json: {}
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:warning] = ['logged out']
    redirect_to '/login'
  end

  private
  def sessions_params
    params.require(:session).permit(:username, :password)
  end
end
