// This is for CREATE an new field_type_user by press enter touch with input in focus
$(document).on('keyup', '#name_add_field_type_users', function(e){
  if(e.keyCode == 13){
    if($(this).val()==""){
      notifsTempo('Merci de remplir le champ', 4000, 'red');
      $(this).css({"border-color":"red"});
    }else {
      $.ajax({
        url: '/field_type_users',
        type: 'POST',
        dataType: 'script',
        data: {
          field_type_user: {
            name: $(this).val()
          }
        },
        error: function(jqXHR){
          var message = capitalizeFirstLetter(JSON.parse(jqXHR.responseText)[0]) + ' ' + JSON.parse(jqXHR.responseText)[1];
          notifsTempo(message, 4000, 'red');
        }
      });
    }
  }
});

// This is for CREATE an new field_type_user by click on green button
$(document).on('click', '#add_field_type_users', function(){
  if($("#name_add_field_type_users").val()==""){
    notifsTempo('Merci de remplir le champ', 4000, 'red');
    $("#name_add_field_type_users").css({"border-color":"red"});
  }else {
    $.ajax({
      url: '/field_type_users',
      type: 'POST',
      dataType: 'script',
      data: {
        field_type_user: {
          name: $("#name_add_field_type_users").val()
        }
      },
      error: function(jqXHR){
        var message = capitalizeFirstLetter(JSON.parse(jqXHR.responseText)[0]) + ' ' + JSON.parse(jqXHR.responseText)[1];
        notifsTempo(message, 4000, 'red');
      }
    });
  }
});

// This is for DELETE an field_type_user by click on red button
$(document).on('click', '#delete_field_type_users', function(){
  $.ajax({
    url: '/field_type_users/' + $(this).parent().parent().attr('id'),
    type: 'DELETE',
    error: function(jqXHR){
      notifsTempo(jqXHR.responseText, 4000, 'red');
    }
  });
});

// This is for UPDATE an field_type_user by press enter with input in focus
$(document).on('keyup', '#name_field_type_user', function(e){
  if(e.keyCode == 13){
    if($(this).val()==""){
      notifsTempo('Merci de remplir le champ', 4000, 'red');
      $(this).css({"border-color":"red"});
    }else {
      $.ajax({
        url: '/field_type_users/'+ $(this).parent().parent().attr('id'),
        type: 'PUT',
        dataType: 'script',
        data: {
          field_type_user: {
            name: $(this).val()
          }
        },
        error: function(jqXHR){
          var message = capitalizeFirstLetter(JSON.parse(jqXHR.responseText)[0]) + ' ' + JSON.parse(jqXHR.responseText)[1];
          notifsTempo(message, 4000, 'red');
        }
      });
    }
  }
});
