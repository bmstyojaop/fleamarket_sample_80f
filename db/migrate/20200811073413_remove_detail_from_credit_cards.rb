class RemoveDetailFromCreditCards < ActiveRecord::Migration[6.0]
  def change
    remove_column :credit_cards, :card_number, :integer, null: false
  end
end
