class AddActiveToAdvertisment < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_advertisments, :active, :boolean, default: :true
  end
end
