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
      flash[:success] = "created acount"
      redirect_to '/'
    else
      flash[:warning] = @user.errors.full_messages
      redirect_to '/signup'
    end
  end
end
