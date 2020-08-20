$(function(){
  function buildHTML(comment){
    if (comment.user_image) {
      let html = `<div class="MainShow__box__comments">
                    <div class="Profile">
                      <div class="Profile__name">
                      </div>
                      <div class="Profile__right">
                        <div class="Image">
                          <img class="user-circle" src="${comment.user_image_url}">
                        </div>
                        <div class="Seller_or_buyer">
                          ${comment.name}
                        </div>
                      </div>
                    </div>
                    <div class="Comment">
                      <div class="Comment__text">
                        ${comment.comment}
                      </div>
                      <div class="Comment__bottom">
                        <div class="Comment__date">
                          <i class="far fa-clock"></i>
                          ${comment.created_at}
                        </div>
                        <div class="Comment__trash">
                          <a item_id="@item" rel="nofollow" data-method="delete" href="/items/${comment.item_id}/comments/${comment.comment_id}"><i class="fa fa-trash"></i>
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>`
      return html;
    } else {
      let html = `<div class="MainShow__box__comments">
                    <div class="Profile">
                      <div class="Profile__name">
                      </div>
                      <div class="Profile__right">
                        <div class="Image">
                          <div class="user-circle">
                            <i class="far smile-wink"></i>
                          </div>
                        </div>
                        <div class="Seller_or_buyer">
                          ${comment.name}
                        </div>
                      </div>
                    </div>
                    <div class="Comment">
                      <div class="Comment__text">
                        ${comment.comment}
                      </div>
                      <div class="Comment__bottom">
                        <div class="Comment__date">
                          <i class="far fa-clock"></i>
                          ${comment.created_at}
                        </div>
                        <div class="Comment__trash">
                          <a item_id="@item" rel="nofollow" data-method="delete" href="/items/${comment.item_id}/comments/${comment.comment_id}"><i class="fa fa-trash"></i>
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>`
      return html;
    };
  }

  function buildHTMLother(comment){
    if (comment.user_image) {
      let html = `<div class="MainShow__box__comments__comment--other">
                    <div class="Profile">
                      <div class="Profile__name">
                      </div>
                      <div class="Profile__right">
                        <div class="Image">
                          <img class="user-circle" src="${comment.user_image_url}">
                      </div>
                      <div class="Seller_or_buyer">
                        ${comment.name}
                      </div>
                    </div>
                  </div>
                  <div class="Comment">
                    <div class="Comment__text">
                      ${comment.comment}
                    </div>
                    <div class="Comment__bottom">
                      <div class="Comment__date">
                        <i class="far fa-clock"></i>
                        ${comment.created_at}
                      </div>
                      <div class="Comment__trash">
                        <a item_id="@item" rel="nofollow" data-method="delete" href="/items/${comment.item_id}/comments/${comment.comment_id}"><i class="fa fa-trash"></i>
                        </a>
                      </div>
                    </div>
                  </div>
                </div>`
      return html;
    } else {
      let html = `<div class="MainShow__box__comments__comment--other">
                    <div class="Profile">
                      <div class="Profile__name">
                      </div>
                      <div class="Profile__right">
                        <div class="Image">
                          <i class="fas fa-user-circle">
                          </i>
                      </div>
                      <div class="Seller_or_buyer">
                        ${comment.name}
                      </div>
                    </div>
                  </div>
                  <div class="Comment">
                    <div class="Comment__text">
                      ${comment.comment}
                    </div>
                    <div class="Comment__bottom">
                      <div class="Comment__date">
                        <i class="far fa-clock"></i>
                        ${comment.created_at}
                      </div>
                      <div class="Comment__trash">
                        <a item_id="@item" rel="nofollow" data-method="delete" href="/items/${comment.item_id}/comments/${comment.comment_id}"><i class="fa fa-trash"></i>
                        </a>
                      </div>
                    </div>
                  </div>
                </div>`
      return html;
    };
  }

  $('#comment_form').on ('submit',function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      if (data.comment_user_id == data.item_user_id) {
        let html = buildHTML(data);
        $('#Comments').append(html);
        $('.Text_area').val('');
        $('.Comment__btn').prop('disabled', false);
      } else {
        let html = buildHTMLother(data);
        $('#Comments').append(html);
        $('.Text_area').val('');
        $('.Comment__btn').prop('disabled', false);
      }
    })
    .fail(function(){
      alert('error');
    })
  })
});