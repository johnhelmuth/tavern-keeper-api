class UpdateApiKeysWithOriginsAndSecret < ActiveRecord::Migration
  def change
    add_column :api_keys, :origins, :json
    add_column :api_keys, :secret, :string
    add_column :api_keys, :status, :integer
  end
end
