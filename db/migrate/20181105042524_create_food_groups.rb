class CreateFoodGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :food_groups do |t|
      t.string :name, null: false
      t.string :description

      t.timestamps
      t.userstamps
    end
  end
end
