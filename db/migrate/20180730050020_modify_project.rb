class ModifyProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :office, :string
    add_column :projects, :priority, :string
    add_column :projects, :deadline, :date


    create_table :project_collaborators do |p|
      p.integer :project_id
      p.integer :user_id
    end
  end
end
