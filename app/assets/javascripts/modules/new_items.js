$(function(){
  var dataBox = new DataTransfer();
  var file_field = document.getElementById('img-file')
  $('#append-js').on('change','#img-file',function(){
    $.each(this.files, function(i, file){
      var fileReader = new FileReader();
      dataBox.items.add(file)
      var num = $('.item-image').length + 1 + i
      var image_no = $('.item-image').length + i
      fileReader.readAsDataURL(file);
      if (num == 10){
        $('#image-box__container').css('display', 'none')
      }
      fileReader.onloadend = function() {
        var src = fileReader.result
        var html= `<div class='item-image' data-image="${file.name}" data-index="${image_no}">
                    <div class=' item-image__content'>
                      <div class='item-image__content--icon'>
                        <img src=${src} width="188" height="180" >
                      </div>
                    </div>
                    <div class='item-image__operetion'>
                      <div class='item-image__operetion--delete'>削除</div>
                    </div>
                  </div>`
        const buildFileField = (num)=> {
          const html = `<div  class="js-file_group" data-index="${num}">
                          <input class="js-file" type="file"
                          name="item[images_attributes][${num}][image]"
                          id="img-file" data-index="${num}">
                        </div>`;
          return html;
        }
        $('.js-file').removeAttr('id');
        $('.img-label').before(html);
        $('#append-js').append(buildFileField(num));
      }; 
      $('#image-box__container').attr('class', `item-num-${num}`)
    });
  });
});