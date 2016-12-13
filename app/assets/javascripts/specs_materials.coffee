$ ->
  # This is for CREATE an new spec_material by press enter touch with input in focus
  $(document).on 'keyup', '#value_new_spec_material', (evt) ->
    if evt.keyCode == 13
      $.ajax '/spec_materials',
        type: 'POST',
        dataType: 'script',
        data: {
          spec_material: {
            spec_value: $(this).val(),
            spec_type_material_name: $(this).parent().parent().children('td').children('select').find(':selected').text()
          }
        }
        error: (jqXHR, textStatus, errorThrown) ->
          $("body").append("<div class='notifs-tempo notif-destroy'><p>" + jqXHR.responseText + "</p></div>");
          delay = (ms, func) -> setTimeout func, ms
          delay 4000, ->  $('.notifs-tempo').remove()


  # This is for CREATE an new spec_material by click on green button
  $(document).on 'click', '#create_new_spec_material', (evt) ->
    $.ajax '/spec_materials',
      type: 'POST',
      dataType: 'script',
      data: {
        spec_material: {
          spec_value: $("#value_new_spec_material").val(),
          spec_type_material_name: $(this).parent().parent().children('td').children('select').find(':selected').text()
        }
      }
      error: (jqXHR, textStatus, errorThrown) ->
        $("body").append("<div class='notifs-tempo notif-destroy'><p>" + jqXHR.responseText + "</p></div>");
        delay = (ms, func) -> setTimeout func, ms
        delay 4000, ->  $('.notifs-tempo').remove()

  # This is for DELETE an spec_material by click on red button
  $(document).on 'click', '#delete_spec_materials', (evt) ->
    $.ajax '/spec_materials/' + $(this).parent().parent().attr('id'),
      type: 'DELETE',
      error: (jqXHR, textStatus, errorThrown) ->
        $("body").append("<div class='notifs-tempo notif-destroy'><p>" + jqXHR.responseText + "</p></div>");
        delay = (ms, func) -> setTimeout func, ms
        delay 4000, ->  $('.notifs-tempo').remove()

  # This is for UPDATE an spec_material by press enter with input in focus
  $(document).on 'keyup', 'input#input_spec_material', (evt) ->
    if evt.keyCode == 13
      $.ajax '/spec_materials/'+ $(this).parent().parent().attr('id'),
        type: 'PUT',
        dataType: 'script',
        data: {
          spec_material: {
            spec_value: $(this).val(),
            spec_type_material_name: $(this).parent().parent().children('td').children('select').find(':selected').text()
          }
        }
        error: (jqXHR, textStatus, errorThrown) ->
          $("body").append("<div class='notifs-tempo notif-destroy'><p>" + jqXHR.responseText + "</p></div>");
          delay = (ms, func) -> setTimeout func, ms
          delay 4000, ->  $('.notifs-tempo').remove()
