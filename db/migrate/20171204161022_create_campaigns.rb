class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.string :company_name
      t.string :email
      t.string :contact_name
      t.string :phone
      t.string :cnpj
      t.integer :campaign_type
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
