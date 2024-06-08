class CreateWorkouts < ActiveRecord::Migration[7.0]
  def change
    create_table :workouts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :exercise_type
      t.integer :duration
      t.integer :intensity
      t.integer :calories_burned

      t.timestamps
    end
  end
end
