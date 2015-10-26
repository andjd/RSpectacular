class UserCommentsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @comment = @user.recieved_user_comments.new
    render :new
  end

  def create
    @comment = current_user.authored_user_comments.new(user_comment_params)

    if @comment.save
      flash[:notice] = ["User Comment Created"]
      redirect_to user_url(@comment.user)
    else
      flash.now[:errors] = @comment.errors.full_messages
      @user = @comment.user
      render :new
    end
  end

  private

  def user_comment_params
    params.require(:user_comment).permit(:comment, :user_id)
  end
end
