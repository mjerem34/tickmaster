  // This is for CREATE an new field_agency by press enter touch with input in focus
  $(document).on('keyup', '#name_new_field_agency', function(evt){
    if (evt.keyCode == 13){
      $("#create_new_field_agency").click();
    }
  });

  // This is for CREATE an new field_agency by click on green button
  $(document).on('click', '#create_new_field_agency', function(){
    $.name_field_agency = $("#name_new_field_agency").val();
    $.ajax({
      url: '/field_agencies',
      type: 'POST',
      dataType: 'script',
      data: {
        field_agency: {
          name: $.name_field_agency
        }
      },
      error: function(jqXHR){
        notifError(jqXHR.responseText);
      },
      success: function(jqXHR){
        $("#name_new_field_agency").val("");
        $("table > tbody").append(`
        <tr id='` + jqXHR + `'>
          <td><input type='text' name='name_field_agency' value='` + $.name_field_agency + `' class='form-control'></td>
          <td><button type='button' name='button' class='btn btn-flat btn-danger' id='delete_field_agency'>-</button></td>
        </tr>
        `);
        notifSuccess();
      }
    });
  });

  // This is for DELETE an field_agency by click on red button
  $(document).on('click', '#delete_field_agency', function(){
    $.id = $(this).parent().parent().attr('id');
    swal({
      title: 'Êtes-vous sur ?',
      text: "Vous ne pourrez pas annuler cette opération !",
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      cancelButtonText: 'Annuler',
      confirmButtonText: 'Confirmer !'

    }).then(function () {
      $.ajax({
        url: '/field_agencies/' + $.id,
        type: 'DELETE',
        error: function(jqXHR){
          notifError(jqXHR.responseText);
        },
        success: function(){
          $("tr#" + $.id).remove();
          notifSuccess();
        }
      });
    })

  });

  // This is for UPDATE an field_agency by press enter with input in focus
  $(document).on('keyup', 'input[name="name_field_agency"]', function(evt){
    if (evt.keyCode == 13){
      $.ajax({
        url: '/field_agencies/'+ $(this).parent().parent().attr('id'),
        type: 'PUT',
        dataType: 'script',
        data: {
          field_agency: {
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
  });
