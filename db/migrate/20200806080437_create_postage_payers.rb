class CreatePostagePayers < ActiveRecord::Migration[6.0]
  def change
    create_table :postage_payers do |t|
      t.string :postage_payer, null: false
      t.timestamps
    end
  end
end
