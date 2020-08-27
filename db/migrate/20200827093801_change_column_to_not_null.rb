class ChangeColumnToNotNull < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :postage_type_id, :integer, null: false
  end
  def down
    change_column :items, :postage_type_id, :integer
  end
end
