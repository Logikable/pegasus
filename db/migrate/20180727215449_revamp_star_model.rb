class RevampStarModel < ActiveRecord::Migration[5.2]
  def change
    drop_table :stars


    create_table :stars do |t|
      t.belongs_to :project, index: true
      t.integer :starrer_id, index: true
      t.integer :starree_id, index: true
      t.timestamps
    end

    add_foreign_key :stars, :users, column: :starrer_id
    add_foreign_key :stars, :users, column: :starree_id
  end
end
