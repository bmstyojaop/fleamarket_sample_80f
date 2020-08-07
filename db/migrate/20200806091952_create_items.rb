class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.string :author, null: false
      t.string :company, null: false
      t.integer :price, null: false
      t.text :item_introduction, null: false
      t.references :category, null: false, foreign_key: true
      t.references :item_condition, null: false, foreign_key: true
      t.references :postage_type, null:false, foreign_key: true
      t.references :postage_payer, null: false, foreign_key: true
      t.references :preparation_day, null: false, foreign_key: true
      # t.references :seller_id, null: false, foreign_key: true
      # t.references :buyer_id, foreign_key: true
      t.timestamps 
    end
  end
end
