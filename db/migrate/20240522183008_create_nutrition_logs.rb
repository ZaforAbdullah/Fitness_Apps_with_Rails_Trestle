class CreateNutritionLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :nutrition_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :meal_type
      t.text :description
      t.integer :calories
      t.date :date

      t.timestamps
    end
  end
end
