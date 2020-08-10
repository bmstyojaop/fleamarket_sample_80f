class AddShippingOriginToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :shipping_origin, :integer, null:false,_suffix: true
  end
end
