class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string        :postcode,         null: false
      t.integer       :prefecture_id,    null: false
      t.string        :address_city,     null: false
      t.string        :address_block,    null: false
      t.string        :address_building
      t.string        :phone_number,     null: false
      t.references    :purchase,         null: false, foreign_key: true 
      t.timestamps
    end
  end
end
