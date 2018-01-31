class RemoveAndAddFieldInCampaingn < ActiveRecord::Migration[5.1]
  def change
    remove_column :campaigns, :company_name
    remove_column :campaigns, :email
    remove_column :campaigns, :contact_name
    remove_column :campaigns, :phone
    remove_column :campaigns, :cnpj

    add_column :campaigns, :name, :string
    add_column :campaigns, :advertiser_id, :integer
    add_column :campaigns, :start_date, :datetime
    add_column :campaigns, :end_date, :datetime
  end
end
