class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]

  def show
    set_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = ['Account created']
      redirect_to '/'
    else
      render 'new'
    end
  end

  def edit
    set_user
  end

  def update
    set_user
    if @user.update(user_params)
      flash[:success] = ['Your account was updated']
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

  def require_same_user
    if current_user != @user
      flash[:danger] = ['You can do that fool!']
      redirect_to root_path
    end
  end
end
