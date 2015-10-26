class GoalsController < ApplicationController


  before_action :confirm_owner, except: [:new, :show, :create]


  def confirm_owner
    @goal = Goal.find(params[:id])
    redirect_to user_url(current_user) unless @goal && @goal.user == current_user
  end

    def new
    @goal = current_user.goals.new
  end

  def create
    # fail
    @goal = current_user.goals.new(goal_params)

    if @goal.save
      flash[:notice] = ["Goal created"]
      redirect_to user_url(current_user)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def edit
      @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      flash[:notice] = ["Goal Updated"]
      redirect_to user_url(@goal.user)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def destroy
  end

  private
  def goal_params
    params.require(:goal).permit(:target, :is_public, :is_completed)
  end

end
