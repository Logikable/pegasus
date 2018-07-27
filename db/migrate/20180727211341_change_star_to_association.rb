class ChangeStarToAssociation < ActiveRecord::Migration[5.2]
  def change
    create_table :stars do |t|
      t.belongs_to :project, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end

    remove_column :projects, :stars
  end
  
end
