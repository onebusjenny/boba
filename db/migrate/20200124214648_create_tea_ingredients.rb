class CreateTeaIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :tea_ingredients do |t|
      t.integer :amount
      t.references :tea, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
