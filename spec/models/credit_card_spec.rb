require 'rails_helper'

describe CreditCard do
  describe '#create' do
    # 1. user_id, card_id, customer_idが存在すればクレジットカードを登録できること
    it "is valid with a user_id, card_id, customer_id" do
      card = build(:credit_card)
      expect(card).to be_valid
    end

    # 2. user_idが空では登録できないこと
    it "is invalid without a user_id" do
      card = build(:credit_card, user_id: nil)
      card.valid?
      expect(card.errors[:user_id]).to include("can't be blank")
    end

    # 3. card_idが空では登録できないこと
    it "is invalid without a card_id" do
      card = build(:credit_card, card_id: nil)
      card.valid?
      expect(card.errors[:card_id]).to include("can't be blank")
    end

    # 4. customer_idが空では登録できないこと
    it "is invalid without a customer_id" do
      card = build(:credit_card, customer_id: nil)
      card.valid?
      expect(card.errors[:customer_id]).to include("can't be blank")
    end

  end
end