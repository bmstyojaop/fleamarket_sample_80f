class ItemsController < ApplicationController

  require "payjp"

  before_action :set_item, only: [:show, :edit, :update, :destroy, :confirm, :pay]
  before_action :show_all_instance, only: [:show, :edit, :update, :destroy, :confirm]
  before_action :set_credit_card, only: [:pay]
  before_action :item_sold?, only: [:pay]

  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to  items_path
    else
      @item.images.new
      render :new
    end
  end


  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
    if item_params[:images_attributes].nil?
      flash.now[:alert] = '更新できませんでした 【画像を１枚以上入れてください】'
      render :edit
    else
      exit_ids = []
      item_params[:images_attributes].each do |a,b|
        exit_ids << item_params[:images_attributes].dig(:"#{a}",:id).to_i
      end
      ids = Image.where(item_id: params[:id]).map{|image| image.id }
      exit_ids_uniq = exit_ids.uniq
      delete__db = ids - exit_ids_uniq
      Image.where(id:delete__db).destroy_all
      @item.touch
      if @item.update(item_params)
        redirect_to  root_path
      else
        flash.now[:alert] = '更新できませんでした'
        render :edit
      end
    end
  end

  def destroy
    if @item.destroy
      redirect_to  root_path
    else
      flash.now[:alert] = '削除できませんでした'
      render :show
    end
  end

  def confirm
  end

  def pay
    #クレジットカードは登録されているかどうか
    if @card.blank?
      redirect_to controller: "credit_cards", action: "new"
      flash[:alert] = '購入にはクレジットカード登録が必要です'
      #クレジットカードがあり、売り切れでもない場合は決済処理を実行
    else
      #保管した顧客IDでpayjpから情報取得
      Payjp.api_key = "sk_test_ed37e1648d66e1e3ab2794fd"
      # 請求を発行
      charge = Payjp::Charge.create(
      amount: @item.price,
      customer: Payjp::Customer.retrieve(@card.customer_id),
      currency: 'jpy'
      )
      # 商品の状態を売り切れに更新
      @item.update!(auction_status: 2)
      redirect_to done_items_path
    end
  end
    

  def done #商品購入完了アクション
  end



  private
  def item_params
    params.require(:item).permit(:item_name, :item_introduction, :item_condition_id, :postage_payer_id, :price, :preparation_day_id, :category_id, :shipping_origin_id, :postage_type_id, images_attributes: [:image, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def show_all_instance
    @user = @item.user 
    @images = Image.where(item_id: params[:id])
    @image = @images.first
  end

  def set_credit_card
    @card = CreditCard.where(user_id: current_user.id).first if CreditCard.where(user_id: current_user.id).present?
  end

  def item_sold?
    @status = @item.auction_status
    if @status == 2
      redirect_to :show
      flash[:alert] = 'この商品は売り切れです'
      #登録された情報がない場合にクレジットカード登録画面に移動
    end
  end


end
