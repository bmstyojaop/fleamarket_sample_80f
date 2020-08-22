class CreditCardsController < ApplicationController

  require "payjp"
  before_action :set_credit_card
  
  def new 
    @card = CreditCard.new
  end

  def create
    # PAY.JPの秘密鍵をセット（環境変数）
    Payjp.api_key = "sk_test_ed37e1648d66e1e3ab2794fd"
  
    # jsで作成したpayjp-tokenが入っているかどうか？
    if params['payjp-token'].blank?
      # トークンが空なら戻す
      redirect_to new_credit_card_path
    else
      # トークンがちゃんとあれば進めて、PAY.JPに登録されるユーザーを作成します。
      customer = Payjp::Customer.create(
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      # PAY.JPのユーザーが作成できたので、creditcardモデルを登録します。
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
    # ログイン中のユーザーのクレジットカード登録の有無を判断
    @card = CreditCard.find_by(user_id: current_user.id)
    if @card.blank?
      # 未登録なら新規登録画面に
      redirect_to new_credit_card_path
    else
      # credentials.yml.encに記載したAPI秘密鍵を呼び出します。
      Payjp.api_key = "sk_test_ed37e1648d66e1e3ab2794fd"
      # ログインユーザーのクレジットカード情報からPay.jpに登録されているカスタマー情報を引き出す
      customer = Payjp::Customer.retrieve(@card.customer_id)
      # カスタマー情報からカードの情報を引き出す
      @card_info = customer.cards.retrieve(@card.card_id)
      @exp_month = @card_info.exp_month.to_s
      @exp_year = @card_info.exp_year.to_s.slice(2,3) 

      # クレジットカード会社を取得したので、カード会社の画像をviewに表示させるため、ファイルを指定する。
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
    # 今回はクレジットカードを削除するだけでなく、PAY.JPの顧客情報も削除する。これによりcreateメソッドが複雑にならない。
    # PAY.JPの秘密鍵をセットして、PAY.JPから情報をする。
    Payjp.api_key = "sk_test_ed37e1648d66e1e3ab2794fd"
    # PAY.JPの顧客情報を取得
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete # PAY.JPの顧客情報を削除
    if @card.destroy # App上でもクレジットカードを削除
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
