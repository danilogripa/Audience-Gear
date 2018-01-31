class AddPartnerFieldInAffiliates < ActiveRecord::Migration[5.1]
  def change
    add_column :affiliates, :partner, :text
  end
end
