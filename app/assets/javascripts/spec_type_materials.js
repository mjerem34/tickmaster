  // This is for CREATE an new spec_type_materials by press enter touch with input in focus
  $(document).on('keyup', '#name_new_spec_type_material', function(evt){
    if(evt.keyCode == 13){
      if($(this).val() == ""){
        notifAlert('Merci de remplir le champ');
        $(this).css({"border-color":"red"});
      }else{
        $.name_spec_type_material = $(this).val();
        $.ajax({
          url: '/spec_type_materials',
          type: 'POST',
          dataType: 'script',
          data: {
            spec_type_material: {
              name: $.name_spec_type_material
            }
          },
          error: function(jqXHR){
            notifError(jqXHR.responseText);
          },
          success: function(jqXHR){
            $('#name_new_spec_type_material').val("");
            $('#table_spec_type_materials > tbody').append(`
              <tr id='` + jqXHR + `'>
                <td><input type='text' name='name' value='` + $.name_spec_type_material + `' class='form-control' id='input_spec_type_material'></td>
                <td><button type='button' name='button' class='btn btn-flat btn-danger' id='delete_spec_type_material'>-</button></td>
              </tr>
            `);
            notifSuccess();
          }
        });
      }
    }
  });


  // This is for CREATE an new spec_type_materials by click on green button
  $(document).on('click', '#create_new_spec_type_material', function(evt){
    if($("#name_new_spec_type_material").val() == ""){
      notifAlert('Merci de remplir le champ');
      $("#name_new_spec_type_material").css({"border-color":"red"});
    }else{
      $.name_spec_type_material = $("#name_new_spec_type_material").val();
      $.ajax({
        url: '/spec_type_materials',
        type: 'POST',
        dataType: 'script',
        data: {
          spec_type_material: {
            name: $.name_spec_type_material
          }
        },
        error: function(jqXHR){
          notifError(jqXHR.responseText);
        },
        success: function(jqXHR){
          $('#name_new_spec_type_material').val("");
          $('#table_spec_type_materials > tbody').append(`
            <tr id='` + jqXHR + `'>
              <td><input type='text' name='name' value='` + $.name_spec_type_material + `' class='form-control' id='input_spec_type_material'></td>
              <td><button type='button' name='button' class='btn btn-flat btn-danger' id='delete_spec_type_material'>-</button></td>
            </tr>
          `);
          notifSuccess();
        }
      });
    }
  });

  // This is for DELETE an spec_type_materials by click on red button
  $(document).on('click', '#delete_spec_type_material', function(evt){
    $.id = $(this).parent().parent().attr('id');
    $.ajax({
      url: '/spec_type_materials/' + $.id,
      type: 'DELETE',
      error: function(jqXHR){
        notifError(jqXHR.responseText);
      },
      success: function(jqWHR){
        notifSuccess();
        $('tr#' + $.id + '').remove();
      }
    });
  });

  // This is for UPDATE an spec_type_materials by press enter with input in focus
  $(document).on('keyup', '#input_spec_type_material', function(evt){
    if(evt.keyCode == 13){
      if($(this).val() == ""){
        notifAlert('Merci de remplir le champ');
        $(this).css({"border-color":"red"});
      }else {
        $.ajax({
          url: '/spec_type_materials/'+ $(this).parent().parent().attr('id'),
          type: 'PUT',
          dataType: 'script',
          data: {
            spec_type_material: {
              name: $(this).val()
            }
          },
          error: function(jqXHR){
            notifError(jqXHR.responseText);
          }, success: function(jqXHR){
            notifSuccess();
          }

        });
      }
    }
  });
