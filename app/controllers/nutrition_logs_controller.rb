class NutritionLogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_nutrition_log, only: [:show, :edit, :update, :destroy]

  def index
    @nutrition_logs = current_user.nutrition_logs
  end

  def show
  end

  def new
    @nutrition_log = current_user.nutrition_logs.build
  end

  def create
    @nutrition_log = current_user.nutrition_logs.build(nutrition_log_params)
    if @nutrition_log.save
      redirect_to @nutrition_log, notice: 'Nutrition log was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @nutrition_log.update(nutrition_log_params)
      redirect_to @nutrition_log, notice: 'Nutrition log was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @nutrition_log.destroy
    redirect_to nutrition_logs_url, notice: 'Nutrition log was successfully deleted.'
  end

  private

  def set_nutrition_log
    @nutrition_log = current_user.nutrition_logs.find(params[:id])
  end

  def nutrition_log_params
    params.require(:nutrition_log).permit(:meal_type, :description, :calories, :date)
  end
end
