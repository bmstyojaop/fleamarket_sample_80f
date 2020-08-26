class ItemsController < ApplicationController

  require "payjp"

  before_action :set_item, only: [:show, :edit, :update, :destroy, :confirm, :pay]
  before_action :show_all_instance, only: [:show, :edit, :update, :destroy, :confirm]
  before_action :set_credit_card, only: [:pay, :confirm]
  before_action :item_sold?, only: [:pay]
  before_action :items_desc
  before_action :set_category, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_ransack,only: [:search, :detail_search]

  def index
    # @status = @item.auction_status
  end

  def new
    @item = Item.new
    @item.images.new

  end

  def get_category_children
    @category_children = Category.find(params[:parent_name]).children
  end

  #jsonで子カテゴリーに紐づく孫カテゴリーの配列を取得
  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
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
    @favorites = Favorite.where(item_id: params[:id])
    @user_favorite = @favorites.where(user_id: current_user)
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
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

  def search
    @search_items = Item.search(params[:keyword])
    @keyword = params[:keyword]
    @items = @q.result(distinct: true)
  end
  def detail_search   
    @search_item = Item.ransack(params[:q]) 
    @items = @search_item.result
    @keyword = params[:name_cont]
  end

  def confirm
    @card = CreditCard.find_by(user_id: current_user.id)
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

  def pay
    if @card.blank?
      redirect_to controller: "credit_cards", action: "new"
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      Payjp.api_key = "sk_test_ed37e1648d66e1e3ab2794fd"
      charge = Payjp::Charge.create(
      amount: @item.price,
      customer: Payjp::Customer.retrieve(@card.customer_id),
      currency: 'jpy'
      )
      @item.update!(auction_status: 2)
      redirect_to done_items_path
    end
  end
    

  def done
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

  def items_desc
    @items = Item.includes(:images).order('created_at DESC')
  end

  def set_credit_card
    @card = CreditCard.where(user_id: current_user.id).first if CreditCard.where(user_id: current_user.id).present?
  end

  def item_sold?
    @status = @item.auction_status
    if @status == 2
      redirect_to :show
      flash[:alert] = 'この商品は売り切れです'
    end
  end

  def set_category  
    @category_parent_array = Category.where(ancestry: nil)
  end

  def set_ransack
    @q = Item.ransack(params[:q])
  end

end