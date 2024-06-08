class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.references :user, null: false, foreign_key: true
      t.string :goal_type
      t.text :description
      t.float :target_value
      t.float :current_value
      t.boolean :achieved
      t.date :target_date
      t.json :progress

      t.timestamps
    end
  end
end
