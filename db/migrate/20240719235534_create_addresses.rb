class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :postcode, null: false
      t.integer :shipping_area_id, null: false
      t.string :city, null: false
      t.string :address1, null: false
      t.string :address2
      t.string :tel, null: false
      t.references :purchase, null: false, foreign_key: true
      t.timestamps
    end
  end
end
