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
      flash[:success] = ["#{user.username} is logged in!"]
      redirect_to '/'
    else
      flash[:warning] = ['Wrong user name or password']
      render 'new'
      # render json: {}
    end
  end

  def destroy
    session[:jwt] = nil
    flash[:warning] = ['logged out']
    redirect_to '/login'
  end
end
