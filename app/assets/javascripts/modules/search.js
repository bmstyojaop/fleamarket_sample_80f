$(function() {
  $(".search-input").on("keyup", function() {
    let input = $(".search-input").val();
    console.log(input);
    $.ajax({
      type: 'GET',
      url: '/items/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(items) {
      console.log(items);
      
      // search_list.empty();
      // if (items.length !== 0) {
      //   items.forEach(function(items){
      //     appendTweet(items);
      //   });
      // }
      // else {
      //   appendErrMsgToHTML("一致するアイテムがありません");
      // }
    })
  });
});