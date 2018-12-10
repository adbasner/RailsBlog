class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true

  def new
    render 'new.html.erb'
  end

  def create
    client_params = {
      username: params[:username],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    }
  end
end
