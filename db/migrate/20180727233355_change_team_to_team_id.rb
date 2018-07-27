class ChangeTeamToTeamId < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :team, :team_id
    rename_column :projects, :team, :team_id
  end
end
