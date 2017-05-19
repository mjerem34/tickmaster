$(document).ready(function(){

  // Creation of sous_category by click on green button
  $(document).on('click', "tr.create_sous_categories > td > button[name='create_button']", function(){
    $.this = $(this).parent().parent();
    $.sous_category_name = $.this.children("td").children("input[name='sous_category_name']").val();
    $.category_id = $.this.children("td").children("input[name='sous_category_name']").data("category");
    $.lvl_urgence_max = $.this.children("td").children("input[name='sous_category_lvl_urgence_max']").val();
    $.ajax({
      url: '/sous_categories',
      type: 'POST',
      dataType: 'script',
      data: {
        "sous_category" :{
          name: $.sous_category_name,
          category_id: $.category_id,
          lvl_urgence_max: $.lvl_urgence_max
        }
      },
      error: function(jqXHR){
        console.log(jqXHR);
        notifError(JSON.parse(jqXHR.responseText)[0]);
      },
      success: function(jqXHR){
        notifSuccess();
        $('.sous_categories_' + $.category_id + ' > tbody > .create_sous_categories').before(`
          <tr class='sous_categories'>
            <td><input type='text' name='sous_category_name' class='form-control' value='`+ $.sous_category_name + `'/></td>
            <td><input type='number' name='sous_category_lvl_urgence_max' max="10" min="0" class='form-control' value='` + $.lvl_urgence_max + `'/></td>
            <td><button type='button' name='destroy_sous_category' class='btn btn-flat btn-danger' data-id='` + jqXHR + `'>-</button></td>
          </tr>
          `);
        $("tr.create_sous_categories > td > input[name='sous_category_name']").val("");
      }
    });
  });

  // Creation by press enter with input type text in focus
  $(document).on('keyup', 'tr.create_sous_categories > td > input[name="sous_category_name"]', function(e){
    if (e.keyCode == 13){
      $(this).parent().parent().children().children("button").click();
    }
  });

  // Creation by press enter with input type number in focus
  $(document).on('keyup', 'tr.create_sous_categories > td > input[name="sous_category_lvl_urgence_max"]', function(e){
    if (e.keyCode == 13){
      $(this).parent().parent().children().children("button").click();
    }
  });

  // Destroy sous_category
  $(document).on('click', 'tr.sous_categories > td > button[name="destroy_sous_category"]', function(){
    $.this = $(this);
    $.ajax({
      url: '/sous_categories/' + $.this.data("id"),
      type: 'DELETE',
      error: function(jqXHR){
        notifError(JSON.parse(jqXHR.responseText)[0]);
      },
      success: function(jqXHR){
        notifSuccess();
        $.this.parent().parent().remove();
      }
    });
  });

  // Change the delete red button by an blue/edit button
  $(document).on('keyup', 'tr.sous_categories > td > input', function(e){
    $.this = $(this).parent().parent();
    $.id = $.this.children("td:nth-child(3)").children("button").data('id');
    $.this.children("td:nth-child(3)").children("button").replaceWith("<button type='button' name='edit_sous_category' class='btn btn-flat btn-primary' data-id='" + $.id + "'><i class='fa fa-pencil' aria-hidden='true'></i></button>");
  });
  $(document).on('change', 'tr.sous_categories > td > input', function(){
    $.this = $(this).parent().parent();
    $.id = $.this.children("td:nth-child(3)").children("button").data('id');
    $.this.children("td:nth-child(3)").children("button").replaceWith("<button type='button' name='edit_sous_category' class='btn btn-flat btn-primary' data-id='" + $.id + "'><i class='fa fa-pencil' aria-hidden='true'></i></button>");
  });


  // Update sous_category by clicking on the blue/edit button
  $(document).on('click', 'button[name="edit_sous_category"]', function(){
    $.this = $(this);
    $.id = $.this.data("id");
    $.sous_category_name = $.this.parent().parent().children().children("input[name='sous_category_name']").val();
    $.sous_category_lvl_urgence_max = $.this.parent().parent().children().children("input[name='sous_category_lvl_urgence_max']").val();
    $.ajax({
      url: '/sous_categories/' + $.id,
      type: 'PUT',
      dataType: 'script',
      data: {
        sous_category: {
          name: $.sous_category_name,
          lvl_urgence_max: $.sous_category_lvl_urgence_max
        }
      },
      error: function(jqXHR){
        notifError(JSON.parse(jqXHR.responseText)[0]);
      },
      success: function(jqXHR){
        notifSuccess();
        $.this.replaceWith("<button type='button' name='destroy_sous_category' class='btn btn-flat btn-danger' data-id='" + $.id + "'>-</button>");
      }
    });
  });
});
