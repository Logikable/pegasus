class ChangeStarsToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :projects, :stars, :integer, :default => 0
  end
end
