crumb :root do
  link "トップページ", root_path
end

crumb :user do
  link "マイページ", user_path(current_user)
end

crumb :profile do
  link "プロフィール", edit_user_path(current_user)
  parent :user
end

crumb :sending_destinations do
  link "発送元・お届け先住所", edit_user_sending_destination_path(current_user)
  parent :user
end

crumb :credit_card do 
  link "クレジットカード情報", credit_card_path(current_user)
  parent :user
end

crumb :item_list do 
  link "出品一覧", item_list_user_path(current_user)
  parent :user
end

crumb :issue do |issue|
  link issue.title, issue_path(issue)
  parent :project_issues, issue.project
end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).