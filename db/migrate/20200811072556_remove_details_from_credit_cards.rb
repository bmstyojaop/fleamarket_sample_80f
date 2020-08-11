class RemoveDetailsFromCreditCards < ActiveRecord::Migration[6.0]
  def change
    remove_column :credit_cards, :expiration_month, :string, null: false
    remove_column :credit_cards, :expiration_year, :integer, null: false
    remove_column :credit_cards, :security_code, :integer, null: false
  end
end
