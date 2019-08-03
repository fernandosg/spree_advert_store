class CreateSpreeAdvertismentsConfigurations < ActiveRecord::Migration[5.2]
  def change
    create_table :spree_advertisments_configurations do |t|
      t.string :preferences, default: ""

      t.timestamps
    end
  end
end
