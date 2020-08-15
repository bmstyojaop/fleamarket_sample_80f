class UsersController < ApplicationController
  before_action :set_user
  def show
    
  end
  
  def edit
    
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
end
