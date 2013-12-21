$('.ui.dropdown').dropdown();
$('.ui.checkbox').checkbox();
$('.ui.form').form({
    username: {
      identifier : 'name',
      rules: [{
          type   : 'empty',
          prompt : 'Please enter a username'
        }]
    }
  })
var uploadKit = {
      onUploadSuccess : function(file, data, response) {
          data = jQuery.parseJSON(data);
          if(data.state == 'success')
          {
            var html = '<div class="item" data-value="'+data.data.id+'">';
            html += '<input type="hidden" name="files[]" value="'+data.data.id+'" />'
            html += '<i class="delete link icon"></i>'
            html += '<a class="header" href="'+data.data.url+'">'
            html += data.data.name

            html += '</a>'
            html += '</div>'
            $("#file_list").append(html);
          } 
      },
      deleteItem : function($item,url){
        $.getJSON(url,function(data){
            if(data.state == 'success')
              $item.remove();
        })
      }
}



