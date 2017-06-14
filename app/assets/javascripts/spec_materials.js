// This is for CREATE an new spec_material by press enter touch with input in focus
$(document).on('keyup', '#value_new_spec_material', function(e){
  if(e.keyCode == 13){
    $('#create_new_spec_material').click();
  }
});


// This is for CREATE an new spec_material by click on green button
$(document).on('click', '#create_new_spec_material', function(){
  if($("#value_new_spec_material").val() == ""){
    notifAlert('Merci de remplir les champs');
    $("#value_new_spec_material").css({"border-color":"red"});
    $("#value_new_spec_material").parent().parent().children('td').children().children('.selectize-input').css({"border-color":"red"});
  }else{
    $.spec_value = $("#value_new_spec_material").val();
    $.spec_type_material_name = $(this).parent().parent().children('td').children('select').find(':selected').text();
    $.ajax({
      url: '/spec_materials',
      type: 'POST',
      dataType: 'script',
      data: {
        spec_material: {
          spec_value: $.spec_value,
          spec_type_material_name: $.spec_type_material_name
        }
      },
      error: function(jqXHR){
        notifError(jqXHR);
      },
      success: function(jqXHR){
        $('#table_spec_materials > tbody').append(`
          <tr id='` + jqXHR + `'>
            <td class='last_select'></td>
            <td><input type='text' name='name' value='` + $.spec_value + `' class='form-control' id='input_spec_material'/></td>
            <td><button type='button' name='button' class='btn btn-flat btn-danger' id='delete_spec_materials'>-</button></td>
          </tr>
        `);
        $(".select_tag_to_take").last().clone().appendTo(".last_select").last();
        $(".select_tag_to_take option[value='" + $.spec_type_material_name + "']").prop('selected', true);
        $("#value_new_spec_material").val("");
        $('.last_select').last().children('select').selectize({create: true, persist: false, createOnBlur: true, closeAfterSelect: true, placeholder: "Merci de sélectionner une valeur"});
        $('.last_select').removeClass('last_select');
        notifSuccess();
      }
    });
  }
});

// This is for DELETE an spec_material by click on red button
$(document).on('click', '#delete_spec_materials', function(){
  $.id = $(this).parent().parent().attr('id');
  $.ajax({
    url: '/spec_materials/' + $.id,
    type: 'DELETE',
    error: function(jqXHR){
      notifError(jqXHR.responseText);
    },
    success: function(jqXHR){
      $("tr#" + $.id).remove();
      notifSuccess();
    }
  });
});

// This is for UPDATE an spec_material by press enter with input in focus
$(document).on('keyup', 'input#input_spec_material', function(e){
  if(e.keyCode == 13){
    if($(this).val() == "" || $(this).parent().parent().children('td').children('select').find(':selected').text() == ""){
      notifsAlert('Merci de remplir les champs');
      $(this).css({"border-color":"red"});
      $(this).parent().parent().children('td').children().children('.selectize-input').css({"border-color":"red"});
    }else{
      $.ajax({
        url: '/spec_materials/'+ $(this).parent().parent().attr('id'),
        type: 'PUT',
        dataType: 'script',
        data: {
          spec_material: {
            spec_value: $(this).val(),
            spec_type_material_name: $(this).parent().parent().children('td').children('select').find(':selected').text()
          }
        },
        error: function(jqXHR){
          notifsError(jqXHR.responseText);
        },
        success: function(){
          notifSuccess();
        }
      });
    }
  }
});
// Mise a jour du type quand on change la valeur de l'input
$(document).on('change', '#spec_type_spec_material', function(){
  $.ajax({
    url: '/spec_materials/'+ $(this).parent().parent().attr('id'),
    type: 'PUT',
    dataType: 'script',
    data: {
      spec_material: {
        spec_value: $(this).parent().parent().children('td').children('#input_spec_material').val(),
        spec_type_material_name: $(this).find(':selected').text()
      }
    },
    error: function(jqXHR){
      notifsError(jqXHR.responseText);
    },
    success: function(){
      notifSuccess();
    }
  });
});
