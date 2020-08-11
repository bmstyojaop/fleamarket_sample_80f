class CreateSendingDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :sending_destinations do |t|
      t.string :phone_number
      t.integer :post_code, null: false
      t.integer :prefecture_code, null: false
      t.string :address_city, null: false
      t.string :address_street, null: false
      t.string :address_building
      t.string :destination_family_name, null: false
      t.string :destination_first_name, null: false
      t.string :destination_family_name_kana, null: false
      t.string :destination_first_name_kana, null: false
      t.references :user
      t.timestamps
    end
  end
end
