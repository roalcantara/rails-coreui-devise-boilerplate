class CreateComponents < ActiveRecord::Migration[5.2]
  def change
    create_table :components do |t|
      t.integer :function, null: false
      t.integer :kind, null: false
      t.integer :group, null: false
      t.integer :category
      t.string :name, null: false
      t.string :description

      t.timestamps
      t.userstamps
    end
  end
end
