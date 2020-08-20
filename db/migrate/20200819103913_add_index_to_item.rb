class AddIndexToItem < ActiveRecord::Migration[6.0]
  def change
    add_index :items, :item_name, length: 30
  end
end
