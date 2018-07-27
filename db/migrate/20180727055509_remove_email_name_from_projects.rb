class RemoveEmailNameFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :name, :string
    remove_column :projects, :email, :string
  end
end
