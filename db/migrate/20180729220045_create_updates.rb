class CreateUpdates < ActiveRecord::Migration[5.2]
  def change
    create_table :updates do |t|
      t.string :description
      t.string :type
      t.string :resource_id
      t.integer :user_id
      
      t.timestamps
    end

    add_foreign_key :updates, :users, column: :user_id
  end
end
