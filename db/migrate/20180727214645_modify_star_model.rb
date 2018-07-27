class ModifyStarModel < ActiveRecord::Migration[5.2]
  def change
    rename_column :stars, :user_id, :starrer_id
    change_table :stars do |s|
        s.belongs_to :user, foreign_key: :starree_id
    end
  end
end
