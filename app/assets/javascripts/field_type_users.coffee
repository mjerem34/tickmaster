$ ->
  # This is for CREATE an new field_type_user by press enter touch with input in focus
  $(document).on 'keyup', '#name_add_field_type_users', (evt) ->
    if evt.keyCode == 13
      $.ajax '/field_type_users',
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

  # This is for CREATE an new field_type_user by click on green button
  $(document).on 'click', '#add_field_type_users', (evt) ->
    $.ajax '/field_type_users',
      type: 'POST',
      dataType: 'script',
      data: {
        field_type_user: {
          name: $("#name_add_field_type_users").val()
        }
      }
      error: (jqXHR, textStatus, errorThrown) ->
        $("body").append("<div class='notifs-tempo notif-destroy'><p>" + jqXHR.responseText + "</p></div>");
        delay = (ms, func) -> setTimeout func, ms
        delay 4000, ->  $('.notifs-tempo').remove()

  # This is for DELETE an field_type_user by click on red button
  $(document).on 'click', '#delete_field_type_users', (evt) ->
    $.ajax '/field_type_users/' + $(this).parent().parent().attr('id'),
      type: 'DELETE',
      error: (jqXHR, textStatus, errorThrown) ->
        $("body").append("<div class='notifs-tempo notif-destroy'><p>" + jqXHR.responseText + "</p></div>");
        delay = (ms, func) -> setTimeout func, ms
        delay 4000, ->  $('.notifs-tempo').remove()

  # This is for UPDATE an field_type_user by press enter with input in focus
  $(document).on 'keyup', 'tr.fields_type_user > td > input[type="text"]', (evt) ->
    if evt.keyCode == 13
      $.ajax '/field_type_users/'+ $(this).parent().parent().attr('id'),
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
