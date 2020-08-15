class RenamePreparationIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items,  :preparation_id, :preparation_day_id
  end
end