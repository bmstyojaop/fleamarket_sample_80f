json.array! @tweets do |item|
  json.id item.id
  json.text item.item_name
  # json.image item.image
  # json.user_id item.user_id
  # json.nickname item.user.nickname
  # json.user_sign_in current_user
end