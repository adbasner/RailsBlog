class UsersController < ApplicationController
  def new
    render 'new.html.erb'
  end

  def create
    @user = User.new(
      username: params[:username],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if @user.save
      flash[:success] = ["Account created"]
      redirect_to '/'
    else
      render 'new'
    end
  end
end
