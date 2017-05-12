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
$(document).on('click', '#delete_field_type_users', function(){
  $.ajax({
    url: '/field_type_users/' + $(this).parent().parent().attr('id'),
    type: 'DELETE',
    error: function(jqXHR){
      notifError(jqXHR.responseText);
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
        }
      });
    }
  }
});

function makeCreation(name){
  swal({
    title: "",
    text: "Voulez vous attribuer ce champ a tous les types utilisateurs ?",
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: "#00a65a",
    confirmButtonText: "Oui",
    cancelButtonText: "Non",
    closeOnConfirm: true,
    closeOnCancel: true
  },
  function(isConfirm){
      $.ajax({
        url: '/field_type_users',
        type: 'POST',
        dataType: 'script',
        data: {
          field_type_user: {
            name: name,
            all: isConfirm
          }
        },
        error: function(jqXHR){
          notifError(jqXHR.responseText);
        }
      });
  });
  return true;
}
