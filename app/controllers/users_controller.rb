class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
  end
  
  def edit
    @nickname = current_user.nickname
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:nickname, :image, :introduce)
    end

end
