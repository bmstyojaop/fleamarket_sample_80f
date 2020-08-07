class AddCardNumberToCreditCards < ActiveRecord::Migration[6.0]
  def change
    add_column :credit_cards, :card_number, :integer
    add_index :credit_cards, :card_number, unique: true
  end
end
