class AddRtgTagField < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :rtg_tag, :text
  end
end
