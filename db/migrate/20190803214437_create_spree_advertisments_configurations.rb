class CreateSpreeAdvertismentsConfigurations < ActiveRecord::Migration[5.2]
  def change
    create_table :spree_advertisments_configurations do |t|
      t.json :preferences

      t.timestamps
    end
  end
end
