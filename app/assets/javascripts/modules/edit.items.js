$(function(){
  var dataBox = new DataTransfer();
  var file_field = document.getElementById('img-file')
  $('#Append-js-edit').on('change','#img-file',function(){
    $.each(this.files, function(i, file){
      var fileReader = new FileReader();
      dataBox.items.add(file)
      var num = $('.ItemImage').length + 1 + i
      var aaa = $('.ItemImage').length + i
      var image_id = Number($('#ImageBox-1').attr('class'))
      var append_div_count = Number($('div[id=1]').length) 
      var noreset_id = image_id + append_div_count

      fileReader.readAsDataURL(file);
      if (num == 10){
        $('#ImageBox__container').css('display', 'none')
      }
      fileReader.onloadend = function() {
        var src = fileReader.result
        var html= `<div class='ItemImage' data-image="${file.name}" data-index="${aaa}" id="${noreset_id-1}">
                      <div class=' ItemImage__content'>
                        <div class='ItemImage__content--icon'>
                          <img src=${src} width="188" height="180" >
                        </div>
                      </div>
                      <div class='ItemImage__operetion'>
                        <div class='ItemImage__operetion--delete'>削除</div>
                      </div>
                    </div>`
        const buildFileField1 = (num)=> {
          const html = `<div  class="js-file_group" data-index="${num}" id=1>
                          <input class="js-file-edit" type="file"
                          name="item[images_attributes][${append_div_count+9}][image]"
                          id="img-file" data-index="${num}" value="${noreset_id}" >
                        </div>`;
          return html;
        }
        $('.js-file').removeAttr('id');
        $('.img-label').before(html);
        $('#Append-js').append(buildFileField(num));
      }; 
      $('#ImageBox__container').attr('class', `Item-num-${num}`)
    });
  });
  $(document).on("click", '.ItemImage__operetion--delete', function(){
    //削除を押されたプレビュー要素を取得
    var target_image = $(this).parent().parent();
    //削除を押されたプレビューimageのfile名を取得
    var target_id = $(target_image).attr('id');
    var target_image_file = $('input[value="'+target_id+'"][type=hidden]');
    //プレビューを削除
    target_image.remove()
    target_image_file.remove()
    //image-box__containerクラスをもつdivタグのクラスを削除のたびに変更
    var num = $('.ItemImage').length
    $('#ImageBox__container').show()
    $('#ImageBox__container').attr('class', `Item-num-${num}`)
  })

  $(document).on("click", '.ItemImage__operetion--delete__file', function(){
    //削除を押されたプレビュー要素を取得
    var target_image = $(this).parent().parent();
    var target_id = Number($(target_image).attr('id'));
    //削除を押されたプレビューimageのfile名を取得
    var target_image_file = $('#Append-js-edit').children('div').children('input[value="'+target_id+'"][type=file]');
    //プレビューを削除
    target_image.remove()
    target_image_file.remove()
    //ImageBox__containerクラスをもつdivタグのクラスを削除のたびに変更
    var num = $('.ItemImage').length
    $('#ImageBox__container').show()
    $('#ImageBox__container').attr('class', `Item-num-${num}`)
  })
  // var dropArea = $(".Item-num-0");
  // dropArea.on("dragenter", function(e){
  //   e.stopPropagation();
  //   e.preventDefault();
  // });
  // //ドラッグした要素がドロップターゲットの上にある時にイベントが発火
  // dropArea.on("dragover", function(e){
  //   e.stopPropagation();
  //   e.preventDefault();
  //   //ドロップエリアに影がつく
  //   $(this).css({'border': '1px solid rgb(204, 204, 204)','box-shadow': '0px 0px 4px'});
  // });
  // dropArea.on("dragleave", function(e){
  //   e.preventDefault();
  //   e.preventDefault();
  //  //ドロップエリアの影が消える
  //   $(this).children.css({'border': '1px dashed rgb(204, 204, 204)','box-shadow': '0px 0px 0px'})
  // },false);
  // //loadイベント発生時に発火するイベント
  // window.onload = function(e){
  //   e.preventDefault();
  //   //ドラッグした要素がドロップターゲットから離れた時に発火するイベント
  //   dropArea[0].addEventListener("dragleave", function(e){
  //     e.stopPropagation()
  //     e.preventDefault();
  //   //ドロップエリアの影が消える
  //     $(this).css({'border': '1px dashed rgb(204, 204, 204)','box-shadow': '0px 0px 0px'})
  //   },false);
  //   //ドラッグした要素をドロップした時に発火するイベント
  //   dropArea[0].addEventListener("drop", function(e) {
  //     e.stopPropagation()
  //     e.preventDefault();
  //     $(this).css({'border': '1px dashed rgb(204, 204, 204)','box-shadow': '0px 0px 0px'}),false;
  //     var files = e.dataTransfer.files;
  //     $("#img-file")[0].files = files;
  //     //ドラッグアンドドロップで取得したデータについて、プレビューを表示
  //     $.each(files, function(i,file){
  //       //アップロードされた画像を元に新しくfilereaderオブジェクトを生成
  //       var fileReader = new FileReader();
  //       //dataTransferオブジェクトに値を追加
  //       dataBox.items.add(file)
  //       //lengthで要素の数を取得
  //       var num = $('.Item-image').length + i + 1
  //       var aaa = $('.Item-image').length + i
  //       //指定されたファイルを読み込む
  //       fileReader.readAsDataURL(file);
  //       // 10枚プレビューを出したらドロップボックスが消える
  //       if (num==10){
  //         $('#ImageBox__container').css('display', 'none')
  //       }
  //       //image fileがロードされた時に発火するイベント
  //       fileReader.onload = function() {
  //         //変数srcにresultで取得したfileの内容を代入
  //         var src = fileReader.result
  //         var html= `<div class='ItemImage' data-image="${file.name}" data-index="${aaa}">
  //                     <div class='ItemImage__content'>
  //                       <div class='ItemImage__content--icon'>
  //                         <img src=${src} width="188" height="180" >
  //                       </div>
  //                     </div>
  //                     <div class='ItemImage__operetion'>
  //                       <div class='ItemImage__operetion--delete'>削除</div>
  //                     </div>
  //                   </div>`
  //         const buildFileField = (num)=> {
  //           const html = `<div  class="js-file_group" data-index="${num}">
  //                           <input class="js-file-edit" type="file"
  //                           name="item[images_attributes][${num}][image]"
  //                           id="img-file" data-index="${num}">
  //                         </div>`;
  //           return html;
  //         }
  //       $('.js-file-edit').removeAttr('id');
  //       //image-box__containerの前にhtmlオブジェクトを追加
  //       $('.img-label').before(html);
  //       $('#Append-js-edit').append(buildFileField(num));
  //       };
  //       //image-box__containerにitem-num-(変数)という名前のクラスを追加する
  //       $('#ImageBox__container').attr('class', `Item-num-${num}`)
  //     })
  //   })
  // }
  //   // windowにdropした時の挙動をキャンセル
  //   $(document).on("dragenter", function(e){
  //     e.stopPropagation();
  //     e.preventDefault();
  //   });
  //   $(document).on("dragover", function(e){
  //     e.stopPropagation();
  //     e.preventDefault();
  //   });
  //   $(document).on("drop", function(e){
  //     e.stopPropagation();
  //     e.preventDefault();
    // });
});