class ChangeTypeToResourceType < ActiveRecord::Migration[5.2]
  def change
    change_column :updates, :type, :resource_type
  end
end
