class DropOldTables < ActiveRecord::Migration
  def change
    ['analytics_campaigns','analytics_users','event_campaigns','event_panel_users','event_panels',
      'event_users','events','newsletters','product_categories','product_category_items','products',
      'subscriptions','user_transactions','user_transaction_products', 'campaign_selected_characters'].each do |table_name|
        if table_exists?(table_name)
          drop_table(table_name, force: true) do |t|
          end 
        end
    end
  end
end
