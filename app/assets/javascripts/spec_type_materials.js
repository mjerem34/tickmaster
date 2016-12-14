  // This is for CREATE an new spec_type_materials by press enter touch with input in focus
  $(document).on('keyup', '#name_new_spec_type_material', function(evt){
    if(evt.keyCode == 13){
      if($(this).val() == ""){
        notifsTempo('Merci de remplir le champ', 4000, 'red');
        $(this).css({"border-color":"red"});
      }else{
        $.ajax({
          url: '/spec_type_materials',
          type: 'POST',
          dataType: 'script',
          data: {
            spec_type_material: {
              name: $(this).val()
            }
          },
          error: function(jqXHR){
            notifsTempo(jqXHR.responseText, 4000, 'red');
          }
        });
      }
    }
  });


  // This is for CREATE an new spec_type_materials by click on green button
  $(document).on('click', '#create_new_spec_type_material', function(evt){
    if($("#name_new_spec_type_material").val() == ""){
      notifsTempo('Merci de remplir le champ', 4000, 'red');
      $("#name_new_spec_type_material").css({"border-color":"red"});
    }else{
      $.ajax({
        url: '/spec_type_materials',
        type: 'POST',
        dataType: 'script',
        data: {
          spec_type_material: {
            name: $("#name_new_spec_type_material").val()
          }
        },
        error: function(jqXHR){
          notifsTempo(jqXHR.responseText, 4000, 'red');
        }
      });
    }
  });

  // This is for DELETE an spec_type_materials by click on red button
  $(document).on('click', '#delete_spec_type_material', function(evt){
    $.ajax({
      url: '/spec_type_materials/' + $(this).parent().parent().attr('id'),
      type: 'DELETE',
      error: function(jqXHR){
        notifsTempo(jqXHR.responseText, 4000, 'red');
      }
    });
  });

  // This is for UPDATE an spec_type_materials by press enter with input in focus
  $(document).on('keyup', '#input_spec_type_material', function(evt){
    if(evt.keyCode == 13){
      if($(this).val() == ""){
        notifsTempo('Merci de remplir le champ', 4000, 'red');
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
            notifsTempo(jqXHR.responseText, 4000, 'red');
          }

        });
      }
    }
  });
