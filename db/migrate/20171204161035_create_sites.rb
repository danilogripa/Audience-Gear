class CreateSites < ActiveRecord::Migration[5.1]
  def change
    create_table :sites do |t|
      t.references :campaign, foreign_key: true
      t.string :name
      t.string :url
      t.string :category
      t.string :type_site

      t.timestamps
    end
  end
end
