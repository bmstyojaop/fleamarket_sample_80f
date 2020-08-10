class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.text :image
      t.text :introduction
      t.timestamps
    end
  end
end
