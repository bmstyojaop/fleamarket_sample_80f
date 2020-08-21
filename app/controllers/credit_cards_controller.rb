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
      render "new"
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
        redirect_to :show
      else
        render "create"
        flash[:alert] = 'クレジットカードを登録できませんでした。'
      end
    end
  end

  def show
    # ログイン中のユーザーのクレジットカード登録の有無を判断
    @card = CreditCard.find_by(user_id: current_user.id)
    if @card.blank?
      # 未登録なら新規登録画面に
      render "new" 
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
      redirect_to user_path(current_user), notice: "削除しました"
    else
      redirect_to action: "show", alert: "削除できませんでした"
    end
  end

  def confirm
  end

  def pay
    @item = Item.find(params[:item_id])
    # すでに購入されていないか？
    if @item.buyer.present? 
      redirect_back(fallback_location: root_path) 
    elsif @card.blank?
      # カード情報がなければ、買えないから戻す
      redirect_to action: "new"
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      # 購入者もいないし、クレジットカードもあるし、決済処理に移行
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      # 請求を発行
      Payjp::Charge.create(
      amount: @item.price,
      customer: @card.customer_id,
      currency: 'jpy',
      )
      # 売り切れなので、productの情報をアップデートして売り切れにします。
      if @item.update(buyer_id: current_user.id)
        flash[:notice] = '購入しました。'
        redirect_to controller: 'items', action: 'show', id: @product.id
      else
        flash[:alert] = '購入に失敗しました。'
        redirect_to controller: 'items', action: 'show', id: @product.id
      end
    end
  end

  def done
  end

  private
  def set_credit_card
    @card = CreditCard.where(user_id: current_user.id).first if CreditCard.where(user_id: current_user.id).present?
  end

end
