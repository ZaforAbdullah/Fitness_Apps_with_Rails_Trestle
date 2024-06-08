class GoalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_goal, only: [:show, :edit, :update, :destroy, :log_progress]

  def index
    @goals = current_user.goals
  end

  def show
  end

  def new
    @goal = current_user.goals.build
  end

  def create
    @goal = current_user.goals.build(goal_params)
    if @goal.save
      redirect_to @goal, notice: 'Goal was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @goal.update(goal_params)
      redirect_to @goal, notice: 'Goal was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @goal.destroy
    redirect_to goals_url, notice: 'Goal was successfully deleted.'
  end

  def log_progress
    date = params[:date]
    value = params[:value].to_f
    @goal.progress[date] = value
    if @goal.save
      redirect_to @goal, notice: 'Progress successfully logged.'
    else
      redirect_to @goal, alert: 'Failed to log progress.'
    end
  end

  private

  def set_goal
    @goal = current_user.goals.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:goal_type, :description, :target_value, :current_value, :achieved, :target_date)
  end
end
