class ItemsController < ApplicationController
  def index
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
    params.require(:item).permit(:item_name, :item_introduction, :item_condition, :auction_status, :postage_payer, :shipping_origin, :price,:author, :company, :reparation_day, :category_id, :shipping_origin, :postage_payer, :images_attributes [:image, :id])
  end
  
end
