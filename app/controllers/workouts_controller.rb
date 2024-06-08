class WorkoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  def index
    @workouts = current_user.workouts
  end

  def show
  end

  def new
    @workout = current_user.workouts.build
  end

  def create
    @workout = current_user.workouts.build(workout_params)
    if @workout.save
      redirect_to @workout, notice: 'Workout was successfully logged.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @workout.update(workout_params)
      redirect_to @workout, notice: 'Workout was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @workout.destroy
    redirect_to workouts_url, notice: 'Workout was successfully deleted.'
  end

  private

  def set_workout
    @workout = current_user.workouts.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:exercise_type, :duration, :intensity, :calories_burned)
  end
end
