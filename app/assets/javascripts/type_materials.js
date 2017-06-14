//  This is for CREATE an new type_material by press enter touch with input in focus
$(document).on('keyup', '#name_new_type_material', function(e){
  if(e.keyCode == 13){
    $('#create_new_type_material').click();
  }
});

//  This is for CREATE an new type_material by click on green button
$(document).on('click', '#create_new_type_material', function(){
  $.this = $(this).parent().parent().children("td").children('input');
  if($.this.val() == ""){
    notifAlert('Merci de remplir le champ');
    $.this.css({"border-color":"red"});
  }else {
    $.ajax({
      url: '/type_materials',
      type: 'POST',
      dataType: 'script',
      data: {
        type_material: {
          name: $.this.val()
        }
      },
      statusCode: {
        422: function(jqXHR){
          notifError(jqXHR.responseText);
        }
      }
    });
  }
});

//  This is for DELETE an type_material by click on red button
$(document).on('click', '#destroy_type_material', function(){
  $.id = $(this).parent().parent().attr('id');
  $.ajax({
    url: '/type_materials/' + $.id,
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
$(document).on('keyup', 'input[name="name_type_material"]', function(e){
  $.this = $(this);
  if(e.keyCode == 13){
    if($.this.val()==""){
      notifAlert('Merci de remplir le champ');
      $.this.css({"border-color":"red"});
    }else {
      $.id = $.this.data('id');
      $.ajax({
        url: '/type_materials/'+ $.id,
        type: 'PUT',
        dataType: 'script',
        data: {
          type_material: {
            name: $.this.val()
          }
        },
        error: function(jqXHR){
          notifError(jqXHR.responseText);
        },
        success: function(jqXHR){
          $('tr#'+ $.id).children('td:nth-child(1)').html($.this.val());
          notifSuccess();
        }
      });
    }
  }
});


// This is to ADD an spec_type_material to the type_material by click on the green btn
$(document).on('click', '#new_spec_type_material', function(){
  $.this = $(this);
  $.spec_type_material_name = $.this.parent().parent().children('td').children('select').find(":selected").html();
  if($.spec_type_material_name == ""){
    notifAlert('Veuillez choisir un type de caracteristique technique avant de valider');
  }else {
    $.type_material_id = $.this.data('type-material-id');
    $.ajax({
      url: '/type_materials/' + $.type_material_id + '/append_spec_type_material',
      type: 'POST',
      dataType: 'script',
      data: {
        spec_type_material: {
          name: $.spec_type_material_name
        }
      },
      error: function(jqXHR){
        notifError(jqXHR.responseText);
      },
      success: function(jqXHR){
        notifSuccess();
        $("#modal_type_material_" + $.type_material_id).find("tbody").append(`
          <tr data-spec-type-material-id="` + jqXHR + `" data-type-material-id="` + $.type_material_id + `">
          <td>` + $.spec_type_material_name + `</td>
          <td><button type="button" name="delete_spec_type_material" class="btn btn-flat btn-danger">-</button></td>
          </tr>
          `);
        }
      });
    }
  });

$(document).on('click', 'button[name="delete_spec_type_material"]', function(){
  $.this = $(this).parent().parent();
  $.spec_type_material_id = $.this.data('spec-type-material-id');
  $.type_material_id = $.this.data('type-material-id');
  $.ajax({
    url: '/type_materials/' + $.type_material_id + '/unbind_spec_type_material',
    type: 'DELETE',
    dataType: 'script',
    data: {
      spec_type_material_id: $.spec_type_material_id
    },
    statusCode: {
      422: function(jqXHR){
        notifError(jqXHR.responseText);
      },
      200: function(){
        notifSuccess();
        $.this.remove();
      }
    }
  });
});
