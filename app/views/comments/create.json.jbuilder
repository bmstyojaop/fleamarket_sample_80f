json.comment_id      @comment.id
json.comment         @comment.comment
json.comment_user_id @comment.user_id
json.name            @comment.user.nickname
json.comment_item_id @comment.item_id
json.item_id         @item.id
json.item_user_id    @item.user_id
json.created_at      @comment.created_at.strftime("%Y年%m月%d日 %H時%M分")
json.user_image_url  @user.image.url