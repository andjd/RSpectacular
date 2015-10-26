class GoalCommentsController < ApplicationController

  def new
    @goal = Goal.find(params[:goal_id])
    @comment = @goal.comments.new
    render :new
  end

  def create
    @comment = GoalComment.new(goal_comment_params)
    @comment.author_id = current_user.id

    if @comment.save
      flash[:notice] = ["Comment Saved"]
      redirect_to user_url(@comment.goal.user)
    else
      flash.new[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  private
  def goal_comment_params
    params.require(:goal_comment).permit(:goal_id, :comment)
  end

end
