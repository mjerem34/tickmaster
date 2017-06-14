// This is to CREATE NEW SELLER by press enter with the input in focus
$(document).on('keyup', '#new_seller_name', function(e){
  if(e.keyCode == 13){
    $('button[name="add_new_seller"]').click();
  }
});

$(document).on('click', 'button[name="add_new_seller"]', function(){
  console.log("hey");
  $.this = $(this);
  $.seller_name = $('input[name="new_seller_name"]').val();
  $('input[name="new_seller_name"]').val("");
  $.ajax({
    url: '/sellers',
    type: 'POST',
    dataType: 'script',
    data: {
      seller: {
        name: $.seller_name,
        actif: true
      }
    },
    error: function(jqXHR){
      notifError(JSON.parse(jqXHR.responseText)[0]);
    }
  });
});

  // This is to EDIT the state of the seller, active or inactive
  // Using the DELETE method
  $(document).on("click", "div.etatVendeur", function(){
    $.this = $(this);
    $.idSeller = $.this.parent().parent().attr("id");
    $.ajax({
      url: '/sellers/' + $.idSeller,
      type: "PUT",
      dataType: 'script',
      data: {
        seller: {
          actif: !$.this.children("input").is(":checked")
        }
      },
      success: function(){
        if($.this.children('label').css("left") == "3px"){
          $.this.children('label').css("left", "43px");
          $.this.children('input[type="checkbox"]').prop('checked', true);
        }else{
          $.this.children('label').css("left", "3px");
          $.this.children('input[type="checkbox"]').prop('checked', false);
        }
      },
      error: function(jqXHR){
        notifError(JSON.parse(jqXHR.responseText)[0]);
      }
    });
  });

  // This is to EDIT the seller's name once the input it is focused and we press enter
  $(document).on('keyup','input[name="name_seller"]', function(e){
    if(e.keyCode == 13){
      $.this = $(this);
      $.name_seller = $.this.val();
      $.seller_id = $.this.data('id')
      if($.name_seller == ""){
        notifAlert("Merci de remplir le champ");
        $("input[name='name_seller']").css({"border-color":"red"});
      }else {
        $.ajax({
          url: '/sellers/' + $.seller_id,
          type: 'PUT',
          dataType: 'script',
          data: {
            seller: {
              name: $.name_seller
            }
          },
          success: function(jqXHR){
            notifSuccess();
            $("td[data-target='#modal_" + $.seller_id + "']").html($.name_seller);
          },
          error: function(jqXHR){
            notifError(JSON.parse(jqXHR.responseText)[0]);
          }
        });
      }
    }
  });

  // TYPE MATERIAL --------------------------
  // This is to ADD an type_material to the seller by press on the green button
  $(document).on('click', '#bind_type_material', function(){
    $.seller_id = $(this).parent().parent().data('seller-id');
    $.type_material_name = $("#table_type_materials_sellers_" + $.seller_id).find("#name_new_type_material").find(':selected').html();
    $.ajax({
      url: "/sellers/" + $.seller_id + "/bind_type_material",
      type: "POST",
      dataType: 'script',
      data: {
        type_material: {
          name: $.type_material_name
        }
      },
      error: function(jqXHR){
        notifError("Le type est déjà lié");
      },
      success: function(jqXHR){
        $("#table_type_materials_sellers_" + $.seller_id + " > tbody").append(`
          <tr data-seller-id="` + $.seller_id + `" data-type-material="` + jqXHR + `">
          <td>` + $.type_material_name + `</td>
          <td><button type="button" id="unbind_type_material" class="btn btn-flat btn-danger">-</button></td>
          </tr>
          `);
          notifSuccess();
        }
      });
    });

    // This is to DELETE an type_material of the seller by press on the red button
    $(document).on('click', '#unbind_type_material', function(){
      $.seller_id = $(this).parent().parent().data("seller-id");
      $.type_material_id = $(this).parent().parent().data("type-material");
      $.ajax({
        url: "/sellers/" + $.seller_id + "/unbind_type_material",
        type: "DELETE",
        dataType: 'script',
        data: {
          type_material: {
            id: $.type_material_id
          }
        },
        error: function(jqXHR){
          notifError(JSON.parse(jqXHR.responseText)[0]);
        },
        success: function(jqXHR){
          $("tr[data-seller-id='" + $.seller_id + "'][data-type-material='" + $.type_material_id + "']").remove();
          notifSuccess();
        }
      });
    });
    // TYPE MATERIAL --------------------------

    // FIELD SELLER ---------------------------
    // This is to ADD AN FIELD to the seller by press enter with the input in focus
    $(document).on('keyup', '#value_new_field_seller', function(e){
      if(e.keyCode == 13){
        $(this).parent().siblings().children("button").click();
      }
    });

    // This is to ADD AN FIELD to the seller by click on the green button
    $(document).on('click', '#bind_new_field_seller', function(){
      $.seller_id = $(this).parent().parent().data("seller-id");
      $.field_seller_name = $("#table_field_seller_" + $.seller_id).find("#name_new_field_seller").find(":selected").html();
      $.content = $("#table_field_seller_" + $.seller_id).find("#value_new_field_seller").val();

      if($.content == ""){
        notifAlert("Merci de remplir les champs");
        $("#table_field_seller_" + $.seller_id).find("#value_new_field_seller").css({"border-color":"red"});
      }else {
        $.ajax({
          url: '/sellers/' + $.seller_id + '/bind_field_seller',
          type: "POST",
          dataType: 'script',
          data: {
            field_seller: {
              name: $.field_seller_name
            },
            content: $.content
          },
          error: function(jqXHR){
            notifError('Vous avez déjà renseigné ce champ');
          },
          success: function(jqXHR){
            notifSuccess();
            $("#table_field_seller_" + $.seller_id).find("#value_new_field_seller").val("");
            $('#table_field_seller_' + $.seller_id).children('tbody').append(`
              <tr data-seller-id='` + $.seller_id + `' data-field-seller-id="` + jqXHR + `">
                <td>` + $.field_seller_name + `</td>
                <td><input name="name" value="` + $.content + `" class="form-control" id="value_field_seller"/></td>
                <td><button type="button" name="button" class="btn btn-flat btn-danger" id="unbind_field_seller">-</button></td>
              </tr>
            `);
          }
        });
      }
    });

    // This is to UPDATE AN FIELD of the seller by press enter with the input in focus
    $(document).on('keyup', '#value_field_seller', function(e){
      if(e.keyCode == 13){
        $.field_seller_id = $(this).parent().parent().data("field-seller-id");
        $.seller_id = $(this).parent().parent().data("seller-id");
        $.content = $(this).val();
        if($(this).val() == ""){
          notifAlert("Merci de remplir les champs");
          $(this).css({"border-color":"red"});
        }else {
          $.ajax({
            url: '/sellers/' + $.seller_id + '/update_field_seller',
            type: "PUT",
            dataType: "script",
            data: {
              field_seller: {
                id: $.field_seller_id
              },
              content: $.content
            },
            error: function(jqXHR){
              notifError(JSON.parse(jqXHR.responseText)[0]);
            },
            success: function(){
              notifSuccess();
            }
          });
        }
      }
    });

    // This is to DELETE an field_seller of the seller by press on the red button
    $(document).on("click", "#unbind_field_seller", function(){
      $.seller_id = $(this).parent().parent().data("seller-id");
      $.field_seller_id = $(this).parent().parent().data("field-seller-id");
      $.ajax({
        url: '/sellers/' + $.seller_id + '/unbind_field_seller',
        type: 'DELETE',
        dataType: 'script',
        data: {
          field_seller: {
            id: $.field_seller_id
          }
        },
        error: function(jqXHR){
          notifError(JSON.parse(jqXHR.responseText)[0]);
        },
        success: function(jqXHR){
          $("tr[data-seller-id='" + $.seller_id + "'][data-field-seller-id='" + $.field_seller_id + "']").remove();
          notifSuccess();
        }
      });
    });
    // FIELD SELLER ---------------------------




    // This is of PERMANENT DELETION of the seller
    $(document).on('click', '#delete_seller', function(){
      if(confirm('Êtes-vous sûr de vouloir supprimer ce vendeur ?')){
        $.seller_id = $(this).data('seller-id');
        $.ajax({
          url: "/sellers/" + $.seller_id,
          type: "DELETE",
          error: function(jqXHR){
            notifError(JSON.parse(jqXHR.responseText)[0]);
          },
          success: function(jqXHR){
            $("tr#" + $.seller_id).remove();
            $("#modal_" + $.seller_id).parent().remove();
            notifSuccess();
          }
        });
      }
    });
