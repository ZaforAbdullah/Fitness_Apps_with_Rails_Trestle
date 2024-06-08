Trestle.resource(:nutrition_logs) do
  menu do
    item :nutrition_logs, icon: "fa fa-star"
  end

  # Customize the table columns shown on the index view.
  table do
    column :meal_type
    column :description
    column :calories, align: :center
    column :date, align: :center
    actions
  end

  # Override the collection method to show only the current user's data
  collection do
    NutritionLog.where(user_id: current_user.id)
  end

  # Customize the form fields shown on the new/edit views.
  form do |nutrition_log|
    text_field :meal_type
    text_area :description
    number_field :calories
    date_field :date
  
    row do
      # col { datetime_field :created_at }
      # col { datetime_field :updated_at }
    end
  end

  # Define the permitted parameters for strong parameters
  params do |params|
    params.require(:nutrition_log).permit(:meal_type, :description, :calories, :date, :created_at, :updated_at).merge(user_id: current_user.id)
  end
end
