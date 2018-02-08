class AddAdvertiseIdOnAffiliate < ActiveRecord::Migration[5.1]
  def change
    add_column :affiliates, :advertiser_id, :integer
  end
end
