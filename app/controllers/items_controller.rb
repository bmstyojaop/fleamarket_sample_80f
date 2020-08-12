class ItemsController < ApplicationController

  before_action :set_item, only: [:show ]
  before_action :set_item, only: [:show ]

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

  private
  def item_params
    params.require(:item).permit(:item_name, :item_introduction, :item_condition_id, :postage_payer_id, :price,:author, :company, :preparation_id, :category_id, :shipping_origin, :postage_type_id, images_attributes: [:image, :id])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def show_all_instance
    @images = Image.where(item_id: params[:id])
    @images_first = Image.where(item_id: params[:id]).first
  end

end
