class CreateTraits < ActiveRecord::Migration[5.2]
  def change
    create_table :traits do |t|
      t.string :title, null: false
      t.integer :kind, null: false

      t.timestamps
      t.userstamps
    end
  end
end
