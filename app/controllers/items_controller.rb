class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :show_all_instance, only: [:show, :edit, :update, :destroy]

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

  private
  def item_params
    params.require(:item).permit(:item_name, :item_introduction, :item_condition_id, :postage_payer_id, :price,:author, :company, :preparation_day_id, :category_id, :shipping_origin_id, :postage_type_id, images_attributes: [:image, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def show_all_instance
    @user = User.find(@item.user_id)
    @images = Image.where(item_id: params[:id])
    @images_first = Image.where(item_id: params[:id]).first
  end

end
