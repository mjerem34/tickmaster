$ ->
  # This is for CREATE an new type_material by press enter touch with input in focus
  $(document).on 'keyup', '#name_new_type_material', (evt) ->
    if evt.keyCode == 13
      $.ajax '/type_materials',
        type: 'POST',
        dataType: 'script',
        data: {
          field_type_user: {
            name: $(this).val()
          }
        }
        error: (jqXHR, textStatus, errorThrown) ->
          $("body").append("<div class='notifs-tempo notif-destroy'><p>" + jqXHR.responseText + "</p></div>");
          delay = (ms, func) -> setTimeout func, ms
          delay 4000, ->  $('.notifs-tempo').remove()

  # This is for CREATE an new type_material by click on green button
  $(document).on 'click', '#create_new_type_material', (evt) ->
    $.ajax '/type_materials',
      type: 'POST',
      dataType: 'script',
      data: {
        field_type_user: {
          name: $("#name_new_type_material").val()
        }
      }
      error: (jqXHR, textStatus, errorThrown) ->
        $("body").append("<div class='notifs-tempo notif-destroy'><p>" + jqXHR.responseText + "</p></div>");
        delay = (ms, func) -> setTimeout func, ms
        delay 4000, ->  $('.notifs-tempo').remove()

  # This is for DELETE an type_material by click on red button
  $(document).on 'click', '#delete_type_material', (evt) ->
    $.ajax '/type_materials/' + $(this).parent().parent().attr('id'),
      type: 'DELETE',
      error: (jqXHR, textStatus, errorThrown) ->
        $("body").append("<div class='notifs-tempo notif-destroy'><p>" + jqXHR.responseText + "</p></div>");
        delay = (ms, func) -> setTimeout func, ms
        delay 4000, ->  $('.notifs-tempo').remove()

  # This is for UPDATE an type_material by press enter with input in focus
  $(document).on 'keyup', '#input_type_material', (evt) ->
    if evt.keyCode == 13
      $.ajax '/type_materials/'+ $(this).parent().parent().attr('id'),
        type: 'PUT',
        dataType: 'script',
        data: {
          field_type_user: {
            name: $(this).val()
          }
        }
        error: (jqXHR, textStatus, errorThrown) ->
          $("body").append("<div class='notifs-tempo notif-destroy'><p>" + jqXHR.responseText + "</p></div>");
          delay = (ms, func) -> setTimeout func, ms
          delay 4000, ->  $('.notifs-tempo').remove()
