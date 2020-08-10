class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @address = current_user.sending_destination.address_street
  end
end
