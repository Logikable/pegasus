class AddTeamToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :team, :string
  end
end
