class AddPartnerFieldInSites < ActiveRecord::Migration[5.1]
  def change
    add_column :sites, :partner, :text
  end
end
