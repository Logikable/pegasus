class AddDoneToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :done, :boolean
  end
end
