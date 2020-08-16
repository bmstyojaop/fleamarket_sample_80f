class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.string :author, null: false
      t.string :company, null: false
      t.integer :price, null: false
      t.text :item_introduction, null: false
      t.integer :category_id, null: false
      t.integer :item_condition_id, null: false
      t.integer :postage_type_id, null:false
      t.integer :postage_payer_id, null: false
      t.integer :preparation_day_id, null: false
      # t.references :seller_id, null: false, foreign_key: true
      # t.references :buyer_id, foreign_key: true

      t.integer :shipping_origin_id, null:false,_suffix: true
      t.integer :auction_status, null:false,_suffix: true, default:"1"
      t.timestamps 
      t.references  :user, null: false, foreign_key: true
    end
  end
end
