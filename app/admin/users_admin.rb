Trestle.resource(:users) do
  menu do
    item :users, icon: "fa fa-star"
  end

  # Customize the table columns shown on the index view.
  table do
    column :email
    column :role
    column :created_at, align: :center
    actions
  end

  # Customize the form fields shown on the new/edit views.
  form do |user|
    text_field :email
    text_field :role
    password_field :password
    password_field :password_confirmation

    row do
      # col { datetime_field :created_at }
      # col { datetime_field :updated_at }
    end
  end

  # Define the permitted parameters for strong parameters
  params do |params|
    params.require(:user).permit(:email, :password, :password_confirmation, :role, :created_at, :updated_at)
  end
end
