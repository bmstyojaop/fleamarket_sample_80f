class AddAuctionStatusToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :auction_status, :integer, null:false,_suffix: true, default:"1"
  end
end
