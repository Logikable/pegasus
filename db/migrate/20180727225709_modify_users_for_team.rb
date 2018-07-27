class ModifyUsersForTeam < ActiveRecord::Migration[5.2]
  def change

    change_column :users, :team, :integer, :default => 1
    add_foreign_key :users, :teams, column: :team
  end
end
