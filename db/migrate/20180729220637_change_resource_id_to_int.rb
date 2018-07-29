class ChangeResourceIdToInt < ActiveRecord::Migration[5.2]
  def change
    change_column :updates, :resource_id, :integer
  end
end
