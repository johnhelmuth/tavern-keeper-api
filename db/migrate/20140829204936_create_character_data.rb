class CreateCharacterData < ActiveRecord::Migration
  def change
    create_table :character_data_stores, id: false do |t|
      t.integer :character_id
      t.string :key
      t.json :value
    end

    add_index :character_data_stores, :character_id
  end
end
