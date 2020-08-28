class ChangeColumnToNull < ActiveRecord::Migration[6.0]
  def up
    change_column_null :items, :postage_type_id, true
  end

  def down
    change_column_null :items, :postage_type_id, false
  end
end
