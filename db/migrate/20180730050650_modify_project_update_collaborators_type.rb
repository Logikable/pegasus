class ModifyProjectUpdateCollaboratorsType < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :collaborators
  end
end
