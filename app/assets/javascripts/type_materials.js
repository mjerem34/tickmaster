//  This is for CREATE an new type_material by press enter touch with input in focus
  $(document).on('keyup', '#name_new_type_material', function(evt){
    if(evt.keyCode == 13){
      if($(this).val()==""){
        notifsTempo('Merci de remplir le champ', 4000, 'red');
        $(this).css({"border-color":"red"});
      }else {
        $.ajax({
          url: '/type_materials',
          type: 'POST',
          dataType: 'script',
          data: {
            type_material: {
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

//  This is for CREATE an new type_material by click on green button
  $(document).on('click', '#create_new_type_material', function(){
    if($("#name_new_type_material").val() == ""){
      notifsTempo('Merci de remplir le champ', 4000, 'red');
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
          notifsTempo(jqXHR.responseText, 4000, 'red');
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
        notifsTempo(jqXHR.responseText, 4000, 'red');
      }
    });
  });

//  This is for UPDATE an type_material by press enter with input in focus
  $(document).on('keyup', '#input_type_material', function(evt){
    if(evt.keyCode == 13){
      if($(this).val()==""){
        notifsTempo('Merci de remplir le champ', 4000, 'red');
        $(this).css({"border-color":"red"});
      }else {
        $.ajax({
          url: '/type_materials/'+ $(this).parent().parent().attr('id'),
          type: 'PUT',
          dataType: 'script',
          data: {
            type_material: {
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


// This is to ADD an spec_type_material to the type_material by click on the green btn
$(document).on('click', '#new_spec_type_material', function(){
  if($('#name_new_spec_type_material').find(":selected").html() == ""){
    notifsTempo("Veuillez choisir un type de caracteristique technique avant de valider", 4000, 'red');
  }else {
    $.ajax({
      url: '/type_materials/' + $(this).data('type-material-id') + '/append_spec_type_material',
      type: 'POST',
      dataType: 'script',
      data: {
        spec_type_material: {
          name: $('#name_new_spec_type_material').find(":selected").html()
        }
      },
      error: function(jqXHR){
        notifsTempo(jqXHR.responseText, 4000, 'red');
      }
    });
  }
});
