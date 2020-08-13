class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    
  end
  
  def edit
    @user = User.find(params[:id])
    @nickname = @user.nickname
    
  end

  def update
    if current_user.update(user_params)
      redirect_to "/users/#{current_user.id}"
    else
      render :edit
    end
  end

  def edit_sending_destination 
    @user = User.find(params[:id])
    @sending_destination = @user.sending_destination(sending_destination_params)
    binding.pry
  end

  def update_sending_destination
    if current_user.update(sending_destination_params)
      redirect_to "/users/#{current_user.id}"
    else
      render :edit_sending_destination
    end
  end

  private
    def user_params
      params.require(:user).permit(:nickname, :image, :introduction, :background)
    end

    def sending_destination_params
      params.require(:sending_destination).permit(:phone_number, :post_code, :prefecture_code, :address_city, :address_street, :address_building, :destination_family_name, :destination_first_name, :destination_family_name_kana, :destination_first_name_kana).merge(user_id: current_user.id)
    end

end
