class RemoveActiveReplaceWithStatus < ActiveRecord::Migration
  def change
    remove_column :characters, :active, :boolean
    add_column :characters, :status, :integer
    
    remove_column :campaigns, :active, :boolean
    add_column :campaigns, :status, :integer
  end
end
