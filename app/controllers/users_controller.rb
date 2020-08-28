class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :item_list]
  before_action :user_items, only: [:show, :edit, :update, :item_list]
  before_action :set_sale_items,   only:   [:index, :show, :item_list]
  before_action :set_user_items,   only:   [:sold_items]

  def show
  end
  
  def edit
    
  end

  def favorites
    @favorites = Favorite.where(user_id: current_user)
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end
  
  def item_list
  end

  def sold_items
    @sold_items = @items.where(auction_status: "2").order('created_at DESC')
  end

  def commented_items
    @commented_items = Item.where(user_id: current_user.id).joins(:comments).uniq
  end

  private
    def user_params
      params.require(:user).permit(:nickname, :image, :introduction, :background)
    end

    def  set_user
      @user = User.find(params[:id])
      @nickname = @user.nickname
    end

    def user_items
      @items = @user.items.order('created_at DESC')
    end

    def set_user_items
      @items = Item.where(user_id: current_user.id).includes(:images).includes(:comments)
    end

    def set_sale_items
      @sale_items = Item.where(user_id: current_user.id).where(auction_status: "1").includes(:images).includes(:comments)
    end
end