$(function(){
  let dataBox = new DataTransfer();
  let file_field = document.getElementById('img-file')
  $('#Append-js').on('change','#img-file',function(){
    $.each(this.files, function(i, file){
      let fileReader = new FileReader();
      dataBox.items.add(file)
      let num = $('.ItemImage').length + 1 + i
      let image_no = $('.ItemImage').length + i
      fileReader.readAsDataURL(file);
      if (num == 10){
        $('#ImageBox__container').css('display', 'none')
      }
      fileReader.onloadend = function() {
        let src = fileReader.result
        let html= `<div class='ItemImage' data-image="${file.name}" data-index="${image_no}">
                    <div class=' ItemImage__content'>
                      <div class='ItemImage__content--icon'>
                        <img src=${src} width="188" height="180" >
                      </div>
                    </div>
                    <div class='ItemImage__operetion'>
                      <div class='ItemImage__operetion--delete'>削除</div>
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
        $('#Append-js').append(buildFileField(num));
      }; 
      $('#ImageBox__container').attr('class', `Item-num-${num}`)
    });
  });
  $(document).on("click", '.ItemImage__operetion--delete', function(){
    let target_image = $(this).parent().parent();
    let target_index = $(target_image).data('index');
    let target_file = $('[data-index="'+target_index+'"].js-file');
    target_image.remove()
    target_file.remove()
    let num = $('.ItemImage').length
    $('#ImageBox__container').show()
    $('#imageBox__container').attr('class', `Item-num-${num}`)
  })
  let dropArea = $(".Item-num-0");
  dropArea.on("dragenter", function(e){
    e.stopPropagation();
    e.preventDefault();
  });
});