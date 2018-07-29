class RenameTypeToResourceType < ActiveRecord::Migration[5.2]
  def change
    change_column :updates, :type, :string
    rename_column :updates, :type, :resource_type
  end
end
