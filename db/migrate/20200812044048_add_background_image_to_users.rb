class AddBackgroundImageToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :background_image, :text
  end
end
