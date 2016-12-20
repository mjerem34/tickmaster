// This is for CREATE an new spec_material by press enter touch with input in focus
$(document).on('keyup', '#value_new_spec_material', function(evt){
  if(evt.keyCode == 13){
    if($(this).val() == ""){
      notifsTempo('Merci de remplir les champs', 4000, 'red');
      $(this).css({"border-color":"red"});
      $(this).parent().parent().children('td').children().children('.selectize-input').css({"border-color":"red"});
    }else{
      $.ajax({
        url: '/spec_materials',
        type: 'POST',
        dataType: 'script',
        data: {
          spec_material: {
            spec_value: $("#value_new_spec_material").val(),
            spec_type_material_name: $(this).parent().parent().children('td').children('select').find(':selected').text()
          }
        },
        error: function(jqXHR){
          notifsTempo(jqXHR.responseText, 4000, 'red');
        }
      });
    }
  }
});


// This is for CREATE an new spec_material by click on green button
$(document).on('click', '#create_new_spec_material', function(){
    if($("#value_new_spec_material").val() == ""){
      notifsTempo('Merci de remplir les champs', 4000, 'red');
      $("#value_new_spec_material").css({"border-color":"red"});
      $("#value_new_spec_material").parent().parent().children('td').children().children('.selectize-input').css({"border-color":"red"});
    }else{
      $.ajax({
        url: '/spec_materials',
        type: 'POST',
        dataType: 'script',
        data: {
          spec_material: {
            spec_value: $("#value_new_spec_material").val(),
            spec_type_material_name: $(this).parent().parent().children('td').children('select').find(':selected').text()
          }
        },
        error: function(jqXHR){
          notifsTempo(jqXHR.responseText, 4000, 'red');
        }
      });
    }
});

// This is for DELETE an spec_material by click on red button
$(document).on('click', '#delete_spec_materials', function(){
  $.ajax({
    url: '/spec_materials/' + $(this).parent().parent().attr('id'),
    type: 'DELETE',
    error: function(jqXHR){
      notifsTempo(jqXHR.responseText, 4000, 'red');
    }
  });
});

// This is for UPDATE an spec_material by press enter with input in focus
$(document).on('keyup', 'input#input_spec_material', function(evt){
  if(evt.keyCode == 13){
    if($(this).val() == "" || $(this).parent().parent().children('td').children('select').find(':selected').text() == ""){
      notifsTempo('Merci de remplir les champs', 4000, 'red');
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
          notifsTempo(jqXHR.responseText, 4000, 'red');
        }
      });
    }
  }
});
