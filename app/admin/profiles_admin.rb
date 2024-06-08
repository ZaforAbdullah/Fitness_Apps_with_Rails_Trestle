Trestle.resource(:profiles) do
  menu do
    item :profiles, icon: "fa fa-star"
  end

  # Customize the table columns shown on the index view.
  table do
    column :weight
    column :height
    column :fitness_goal
    column :created_at, align: :center
    actions
  end

  # Override the collection method to show only the current user's data
  collection do
    Profile.where(user_id: current_user.id)
  end

  # Customize the form fields shown on the new/edit views.
  form do |profile|
    number_field :weight
    number_field :height
    text_field :fitness_goal

    row do
      # col { datetime_field :created_at }
      # col { datetime_field :updated_at }
    end
  end

  # Define the permitted parameters for strong parameters
  params do |params|
    params.require(:profile).permit(:weight, :height, :fitness_goal, :created_at, :updated_at).merge(user_id: current_user.id)
  end
end
