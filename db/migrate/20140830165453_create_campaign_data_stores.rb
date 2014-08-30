class CreateCampaignDataStores < ActiveRecord::Migration
  def change
    create_table :campaign_data_stores, id: false do |t|
      t.integer :campaign_id
      t.string :key
      t.json :value
    end

    add_index :campaign_data_stores, :campaign_id
  end
end
