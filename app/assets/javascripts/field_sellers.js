// This is for UPDATE on press enter in the input
$(document).on('keyup', 'input[name="name_field_seller"]', function(e){
  if(e.keyCode == 13){
    if($(this).val() == ""){
      notifAlert('Merci de remplir le champ');
      $(this).css({"border-color":"red"});
    }else{
      $.ajax({
        url: '/field_sellers/' + $(this).parent('td').parent('tr').attr('id'),
        type: 'PUT',
        dataType: 'script',
        data: {
          field_seller: {
            name: $(this).val()
          }
        },
        error: function(jqXHR){
          notifsError(jqXHR.responseText);
        },
        success: function(jqXHR){
          notifSuccess();
        }
      });
    }
  }
});

// This is for DELETE on click on the red button
$(document).on('click', 'button[name="destroy_field_sellers"]', function(){
  $.id = $(this).parent('td').parent('tr').attr('id');
  $.ajax({
    url: '/field_sellers/' + $.id,
    type: 'DELETE',
    error: function(jqXHR){
      notifsError(jqXHR.responseText);
    },
    success: function(jqXHR){
      $("tr#" + $.id).remove();
      notifSuccess();
    }
  });
});

// This is for CREATE on click on the green button
$(document).on('click', 'button[name="create_field_seller"]', function(){
  $.name_field_seller = $('input[name="name_new_field_seller"]').val();
  if($.name_field_seller == ""){
    notifAlert('Merci de remplir le champ');
    $('input[name="name_new_field_seller"]').css({"border-color":"red"});
  }else{
    $.ajax({
      url: '/field_sellers',
      type: 'POST',
      dataType: 'script',
      data: {
        field_seller: {
          name: $.name_field_seller
        }
      },
      error: function(jqXHR){
        notifError(JSON.parse(jqXHR.responseText)[0]);
      },
      success: function(jqXHR){
        $("#table_field_sellers > tbody").append(`
          <tr id='` + jqXHR + `'>
            <td><input type='text' name='name_field_seller' value='` + $.name_field_seller + `' class='form-control'/></td>
            <td><button type="button" name="destroy_field_sellers" class='btn btn-flat btn-danger'>-</button></td>
          </tr>
        `);
        $('input[name="name_new_field_seller"]').val('');
        notifSuccess();
      }
    });
  }
});

// This is for CREATE on press enter on the input
$(document).on('keyup', 'input[name="name_new_field_seller"]', function(e){
  if(e.keyCode == 13){
    $('button[name="create_field_seller"]').click();
  }
});
