class CreateAffiliates < ActiveRecord::Migration[5.1]
  def change
    create_table :affiliates do |t|
      t.references :campaign, foreign_key: true
      t.string :name
      t.string :url
      t.string :category

      t.timestamps
    end
  end
end
