class RenamePermissionIdToPermission < ActiveRecord::Migration
  def change
    rename_column :campaigns, :permission_id, :permission
    rename_column :characters, :permission_id, :permission
  end
end
