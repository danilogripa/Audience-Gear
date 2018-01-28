class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :company_name
      t.string :email
      t.string :contact_name
      t.string :phone
      t.string :cnpj
      t.integer :user_type
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
