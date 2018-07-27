class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :description

      t.timestamps
    end

    change_column :projects, :team, :integer, :default => 1
    add_foreign_key :projects, :teams, column: :team
  end
end
