class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if @user
      login!(@user)
      redirect_to :root
    else
      flash.now[:errors] = ["Login Fail!"]

      render :new
    end

  end

  def destroy
    logout!
    redirect_to :root
  end
end
