class CreateAdvertisments < ActiveRecord::Migration[5.2]
  def change
    create_table :spree_advertisments do |t|
      t.string :code
      t.string :type_advertisement
      t.text :content
      t.references :advrt_rf, polymorphic: true

      t.timestamps
    end
  end
end
