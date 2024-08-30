class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.string  :post,           null: false
      t.integer :prefecture_id,  null: false
      t.string  :municipality,   null: false
      t.string  :street_address, null: false
      t.string  :building_name
      t.string  :telephone,      null: false
      t.integer :history_id,     null: false
      t.timestamps
    end
  end
end
