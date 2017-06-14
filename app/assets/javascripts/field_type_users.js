// This is for CREATE an new field_type_user by press enter touch with input in focus
$(document).on('keyup', '#name_create_field_type_users', function(e){
  if(e.keyCode == 13){
    if($(this).val()==""){
      notifAlert('Merci de remplir le champ');
      $(this).css({"border-color":"red"});
    }else {
      makeCreation($(this).val());
    }
  }
});

// This is for CREATE an new field_type_user by click on green button
$(document).on('click', '#create_field_type_users', function(){
  if($("#name_create_field_type_users").val()==""){
    notifAlert('Merci de remplir le champ');
    $("#name_create_field_type_users").css({"border-color":"red"});
  }else {
    makeCreation($("#name_create_field_type_users").val());
  }
});

// This is for DELETE an field_type_user by click on red button
$(document).on('click', '#unbinds', function(){
  $.field_type_user_id = $(this).parent().parent().attr('id');
  $.ajax({
    url: '/field_type_users/' + $.field_type_user_id,
    type: 'DELETE',
    error: function(jqXHR){
      notifError(jqXHR.responseText);
    },
    success: function(jqXHR){
      $("tr#" + $.field_type_user_id).remove();
      notifSuccess();
    }
  });
});

// This is for UPDATE an field_type_user by press enter with input in focus
$(document).on('keyup', '#name_field_type_user', function(e){
  if(e.keyCode == 13){
    if($(this).val()==""){
      notifAlert('Merci de remplir le champ');
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
          notifError(jqXHR.responseText);
        },
        success: function(jqXHR){
          notifSuccess();
        }
      });
    }
  }
});

function makeCreation(name){
  $.name_field_type_user = name;
  swal({
    title: '',
    text: "Voulez vous attribuer ce champ a tous les types utilisateurs ?",
    type: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Oui',
    cancelButtonText: 'Non',
    confirmButtonClass: 'btn btn-block btn-flat btn-success',
    cancelButtonClass: 'btn btn-block btn-flat btn-danger',
    buttonsStyling: false
  }).then(function () {
    $.ajax({
      url: '/field_type_users',
      type: 'POST',
      dataType: 'script',
      data: {
        field_type_user: {
          name: $.name_field_type_user,
          all: true
        }
      },
      error: function(jqXHR){
        notifError(jqXHR.responseText);
      },
      success: function(jqXHR){
        $("#name_create_field_type_users").val("");
        $("table#table_field_type_users > tbody").append(`
          <tr id='` + jqXHR + `' class='fields_type_user'>
          <td><input type='text' name='name_field_type_users' value='` + $.name_field_type_user + `' class='form-control' id='name_field_type_user'/></td>
          <td><button type='button' name='unbinds' class='btn btn-flat btn-danger' id='unbinds'>-</button></td>
          </tr>
          `);
          notifSuccess();
        }
      });
  }, function (dismiss) {
    // dismiss can be 'cancel', 'overlay',
    // 'close', and 'timer'
    if (dismiss === 'cancel') {
      $.ajax({
        url: '/field_type_users',
        type: 'POST',
        dataType: 'script',
        data: {
          field_type_user: {
            name: $.name_field_type_user,
            all: false
          }
        },
        error: function(jqXHR){
          notifError(jqXHR.responseText);
        },
        success: function(jqXHR){
          $("#name_create_field_type_users").val("");
          $("table#table_field_type_users > tbody").append(`
            <tr id='` + jqXHR + `' class='fields_type_user'>
            <td><input type='text' name='name_field_type_users' value='` + $.name_field_type_user + `' class='form-control' id='name_field_type_user'/></td>
            <td><button type='button' name='unbinds' class='btn btn-flat btn-danger' id='unbinds'>-</button></td>
            </tr>
            `);
            notifSuccess();
          }
        });
    }
  })
    return true;
  }
