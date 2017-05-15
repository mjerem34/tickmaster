//  This is for CREATE an new type_material by press enter touch with input in focus
  $(document).on('keyup', '#name_new_type_material', function(evt){
    if(evt.keyCode == 13){
      if($(this).val()==""){
        notifAlert('Merci de remplir le champ');
        $(this).css({"border-color":"red"});
      }else {
        $.name = $(this).val();
        $.ajax({
          url: '/type_materials',
          type: 'POST',
          dataType: 'script',
          data: {
            type_material: {
              name: $.name
            }
          },
          error: function(jqXHR){
            notifError(jqXHR.responseText);
          },
          success: function(jqXHR){
            $("#name_new_type_material").val("");
            $("#table_type_material > tbody").append(`
            <tr id='` + jqXHR.responseText + `'>
              <td><input type='text' name='name' value='` + $.name + `' class='form-control' id='input_type_material'></td>
              <td><button type='button' name='button' class='btn btn-flat btn-danger' id='delete_type_material'>-</button></td>
            </tr>
            `);
          }
        });
      }
    }
  });

//  This is for CREATE an new type_material by click on green button
  $(document).on('click', '#create_new_type_material', function(){
    if($("#name_new_type_material").val() == ""){
      notifAlert('Merci de remplir le champ');
      $("#name_new_type_material").css({"border-color":"red"});
      }else{
        $.ajax({
        url: '/type_materials',
        type: 'POST',
        dataType: 'script',
        data: {
          type_material: {
            name: $("#name_new_type_material").val()
          }
        },
        error: function(jqXHR){
          notifError(jqXHR.responseText);
        },
        success: function(jqXHR){
          $("#name_new_type_material").val("");
          $("#table_type_material > tbody").append(`
          <tr id='` + jqXHR.responseText + `'>
            <td><input type='text' name='name' value='` + $.name + `' class='form-control' id='input_type_material'></td>
            <td><button type='button' name='button' class='btn btn-flat btn-danger' id='delete_type_material'>-</button></td>
          </tr>
          `);
        }
      });
    }
  });

//  This is for DELETE an type_material by click on red button
  $(document).on('click', '#delete_type_material', function(){
    $.ajax({
      url: '/type_materials/' + $(this).parent().parent().attr('id'),
      type: 'DELETE',
      error: function(jqXHR){
        notifError(jqXHR.responseText);
      },
      success: function(jqXHR){
        notifSuccess();
        $("tr#" + $.id).remove();
      }
    });
  });

//  This is for UPDATE an type_material by press enter with input in focus
  $(document).on('keyup', '#input_type_material', function(evt){
    if(evt.keyCode == 13){
      if($(this).val()==""){
        notifAlert('Merci de remplir le champ');
        $(this).css({"border-color":"red"});
      }else {
        $.id = $(this).parent().parent().attr('id');
        $.ajax({
          url: '/type_materials/'+ $.id,
          type: 'PUT',
          dataType: 'script',
          data: {
            type_material: {
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


// This is to ADD an spec_type_material to the type_material by click on the green btn
$(document).on('click', '#new_spec_type_material', function(){
  if($('#name_new_spec_type_material').find(":selected").html() == ""){
    notifAlert('Veuillez choisir un type de caracteristique technique avant de valider');
  }else {
    $.name = $('#name_new_spec_type_material').find(":selected").html();
    $.type_material_id = $(this).data('type-material-id');
    $.ajax({
      url: '/type_materials/' + $.type_material_id + '/append_spec_type_material',
      type: 'POST',
      dataType: 'script',
      data: {
        spec_type_material: {
          name: $.name
        }
      },
      error: function(jqXHR){
        notifError(jqXHR.responseText);
      },
      success: function(jqXHR){
        notifSuccess();
        $("#modal_type_material_" + $.type_material_id).find("tbody").append(`
          <tr data-spec-type-material-id="` + jqXHR.responseText + `" data-type-material-id="` + $.type_material_id + `">
            <td>` + $.name + `</td>
            <td><button type="button" name="button" class="btn btn-flat btn-danger" id="delete_spec_type_material">-</button></td>
          </tr>
        `);

      }
    });
  }
});
