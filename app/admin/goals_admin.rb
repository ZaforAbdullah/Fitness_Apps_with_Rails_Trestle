Trestle.resource(:goals) do
  menu do
    item :goals, icon: "fa fa-star"
  end

  # Customize the table columns shown on the index view.
  table do
    column :goal_type
    column :description
    column :target_value
    column :current_value
    column :achieved, align: :center
    column :target_date, align: :center
    actions
  end

  # Override the collection method to show only the current user's data
  collection do
    Goal.where(user_id: current_user.id)
  end

  # Customize the form fields shown on the new/edit views.
  form do |goal|
    text_field :goal_type
    text_area :description
    number_field :target_value
    number_field :current_value
    check_box :achieved
    datetime_field :target_date
  
    row do
      # col { datetime_field :created_at }
      # col { datetime_field :updated_at }
    end
  end

  # Define the permitted parameters for strong parameters
  params do |params|
    params.require(:goal).permit(:goal_type, :description, :target_value, :current_value, :achieved, :target_date, :created_at, :updated_at).merge(user_id: current_user.id)
  end
end
