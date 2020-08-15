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
    var target_image = $(this).parent().parent();
    var target_id = $(target_image).attr('id');
    var target_image_file = $('input[value="'+target_id+'"][type=hidden]');
    target_image.remove()
    target_image_file.remove()
    var num = $('.ItemImage').length
    $('#ImageBox__container').show()
    $('#ImageBox__container').attr('class', `Item-num-${num}`)
  })

  $(document).on("click", '.ItemImage__operetion--delete__file', function(){
    var target_image = $(this).parent().parent();
    var target_id = Number($(target_image).attr('id'));
    var target_image_file = $('#Append-js-edit').children('div').children('input[value="'+target_id+'"][type=file]');
    target_image.remove()
    target_image_file.remove()
    var num = $('.ItemImage').length
    $('#ImageBox__container').show()
    $('#ImageBox__container').attr('class', `Item-num-${num}`)
  })
});