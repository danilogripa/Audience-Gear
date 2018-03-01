class AddAdvertiserTypeToAdvertiser < ActiveRecord::Migration[5.1]
  def change
    add_column :advertisers, :advertiser_type, :integer
  end
end
