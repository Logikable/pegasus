class AddColumnsToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :title, :string
    add_column :projects, :owner, :string
    add_column :projects, :collaborators, :string
    add_column :projects, :stakeholders, :string
    add_column :projects, :description, :string
    add_column :projects, :tasks, :string
    add_column :projects, :milestones, :string
    add_column :projects, :stars, :string
  end
end
