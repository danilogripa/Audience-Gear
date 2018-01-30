class CreateAdvertisers < ActiveRecord::Migration[5.1]
  def change
    create_table :advertisers do |t|
      t.string :company_name
      t.string :email
      t.string :phone
      t.string :contact_name
      t.string :contact_phone
      t.string :cnpj
      t.boolean :status

      t.timestamps
    end
  end
end
