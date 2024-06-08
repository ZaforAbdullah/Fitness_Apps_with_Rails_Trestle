class ActivityAnalysisService
  def initialize(user)
    @user = user
    @workouts = @user.workouts
  end

  def analyze
    {
      workout_summary: workout_summary,
      recommendations: recommendations
    }
  end

  private

  def workout_summary
    {
      total_workouts: @workouts.count,
      total_duration: @workouts.sum(:duration),
      total_calories_burned: @workouts.sum(:calories_burned),
      average_intensity: @workouts.average(:intensity)
    }
  end

  def recommendations
    recs = []
    recs << "Increase workout intensity" if average_intensity < 3
    recs << "Add more cardio workouts" if cardio_workouts.count < 3
    recs << "Consider strength training" if strength_workouts.count < 2
    recs << "You are on track! Keep up the good work!" if recs.empty?
    recs
  end

  def average_intensity
    @workouts.average(:intensity) || 0
  end

  def cardio_workouts
    @workouts.where(exercise_type: 'cardio')
  end

  def strength_workouts
    @workouts.where(exercise_type: 'strength')
  end
end
