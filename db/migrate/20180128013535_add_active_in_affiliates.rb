class AddActiveInAffiliates < ActiveRecord::Migration[5.1]
  def change
    add_column :affiliates, :active, :boolean, default: true
  end
end
