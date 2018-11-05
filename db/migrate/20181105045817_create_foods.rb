class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.references :food_group, foreign_key: true
      t.string :name, null: false
      t.string :description

      t.timestamps
      t.userstamps
    end
  end
end
