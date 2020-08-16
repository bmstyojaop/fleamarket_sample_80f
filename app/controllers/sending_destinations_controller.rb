class SendingDestinationsController < ApplicationController
  before_action :set_sending_destination

  def edit
  end

  def update
    if @sending_destination.update(sending_destination_params)
      redirect_to user_path
    else
      render :edit_user_sending_destination
    end
  end

  private
  def sending_destination_params
    params.require(:sending_destination).permit(:phone_number, :post_code, :prefecture_code, :address_city, :address_street, :address_building, :destination_family_name, :destination_first_name, :destination_family_name_kana, :destination_first_name_kana).merge(user_id: current_user.id)
  end

  def set_sending_destination
    @user = User.find(params[:id])
    @sending_destination = @user.sending_destination
  end

end
