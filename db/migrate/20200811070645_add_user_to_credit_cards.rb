class AddUserToCreditCards < ActiveRecord::Migration[6.0]
  def change
    add_reference :credit_cards, :user, null: false, foreign_key: true
    add_column :credit_cards, :customer_id, :string, null: false
    add_column :credit_cards, :card_id, :string, null: false
  end
end
 