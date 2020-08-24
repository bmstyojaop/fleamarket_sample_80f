class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update ]
  before_action :user_items, only: [:show, :edit, :update ]
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
end
