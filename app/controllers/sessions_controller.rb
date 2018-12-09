class SessionsController < ApplicationController
  def new
    render 'new.html.erb'
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      jwt = JWT.encode(
        {
          user: user.id, # the data to encode
          exp: 24.hours.from_now.to_i # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        'HS256' # the encryption algorithm
      )
      # render json: {jwt: jwt, email: user.email}, status: :created
      flash[:success] = 'logged in'
      redirect_to '/pages/about'
    else
      flash[:warning] = 'wrong password dummy'
      redirect_to '/login'
      render json: {}
    end
  end

  def destroy
    session[:jwt] = nil
    flash[:success] = 'logged out'
    redirect_to '/login'
  end


end
