class RenameCampaignUsersToMembers < ActiveRecord::Migration
  def change
    rename_table :campaign_users, :campaign_members
  end
end
