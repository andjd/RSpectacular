class UsersController < ApplicationController
  def index

  end

  def show
    @user = User.find(params[:id])
    @goals = @user.goals
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to :root
    else
      flash.now[:errors] = @user.errors.full_messages
      @user ||= User.new
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
