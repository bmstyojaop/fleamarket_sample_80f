class SendingDestinationsController < ApplicationController
  def edit
    @user = User.find(params[:id])
    @sending_destination = @user.sending_destination
  end

  def update
    @user = User.find(params[:id])
    @sending_destination = @user.sending_destination
    if @sending_destination.update(sending_destination_params)
      redirect_to "/users/#{current_user.id}"
    else
      render :edit_user_sending_destination
    end
  end

  def sending_destination_params
    params.require(:sending_destination).permit(:phone_number, :post_code, :prefecture_code, :address_city, :address_street, :address_building, :destination_family_name, :destination_first_name, :destination_family_name_kana, :destination_first_name_kana).merge(user_id: current_user.id)
  end


end
