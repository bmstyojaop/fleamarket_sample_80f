class CreditCardsController < ApplicationController

  require "payjp"
  before_action :set_credit_card
  
  def new 
    @card = CreditCard.new
  end

  def create
    Payjp.api_key = "sk_test_ed37e1648d66e1e3ab2794fd"
  
    if params['payjp-token'].blank?
      redirect_to new_credit_card_path
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        flash[:notice] = 'クレジットカードの登録が完了しました'
        redirect_to credit_card_path(@card)
      else
        flash[:alert] = 'クレジットカードを登録できませんでした。'
        rdirect_to credit_cards_path
      end
    end
  end

  def show
    @card = CreditCard.find_by(user_id: current_user.id)
    if @card.blank?
      redirect_to new_credit_card_path
    else
      Payjp.api_key = "sk_test_ed37e1648d66e1e3ab2794fd"
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_info = customer.cards.retrieve(@card.card_id)
      @exp_month = @card_info.exp_month.to_s
      @exp_year = @card_info.exp_year.to_s.slice(2,3) 

      @card_brand = @card_info.brand
      case @card_brand
      when "Visa"
        @card_image = "visa.png"
      when "JCB"
        @card_image = "jcb.png"
      when "MasterCard"
        @card_image = "master-card.png"
      when "American Express"
        @card_image = "american_express.png"
      when "Diners Club"
        @card_image = "dinersclub.png"
      when "Discover"
        @card_image = "discover.png"
      end
    end
  end



  def destroy
    Payjp.api_key = "sk_test_ed37e1648d66e1e3ab2794fd"
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete 
    if @card.destroy 
      redirect_to user_path(current_user), notice: "クレジットカード情報を削除しました"
    else
      redirect_to action: "show", alert: "クレジットカード情報を削除できませんでした"
    end
  end

  

  private
  def set_credit_card
    @card = CreditCard.where(user_id: current_user.id).first if CreditCard.where(user_id: current_user.id).present?
  end

end
