class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :company_name
      t.string :email
      t.string :contact_name
      t.string :phone
      t.string :cnpj
      t.integer :user_type
      t.integer :status

      t.timestamps
    end
  end
end
