Trestle.resource(:workouts) do
  menu do
    item :workouts, icon: "fa fa-star"
  end

  # Customize the table columns shown on the index view.
  table do
    column :exercise_type
    column :duration, align: :center
    column :intensity, align: :center
    column :calories_burned, align: :center
    column :created_at, align: :center
    actions
  end

  # Override the collection method to show only the current user's data
  collection do
    Workout.where(user_id: current_user.id)
  end

  # Customize the form fields shown on the new/edit views.
  form do |workout|
    text_field :exercise_type
    number_field :duration
    number_field :intensity
    number_field :calories_burned

    row do
      # col { datetime_field :created_at }
      # col { datetime_field :updated_at }
    end
  end

  # Define the permitted parameters for strong parameters
  params do |params|
    params.require(:workout).permit(:exercise_type, :duration, :intensity, :calories_burned, :created_at, :updated_at).merge(user_id: current_user.id)
  end
end
