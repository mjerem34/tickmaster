// This is to CREATE NEW SELLER by press enter with the input in focus
$(document).on('keyup', '#new_seller_name', function(e){
  if(e.keyCode == 13){
    $(this).focusout();
    var seller_name = $(this).val();
    $.ajax({
      url: '/sellers',
      type: 'POST',
      dataType: 'script',
      data: {
        seller: {
          name: seller_name,
          actif: true
        }
      },
      error: function(jqXHR){
        notifsTempo(jqXHR.responseText, 4000, 'red');
      }
    });
  }
});

// This is to ADD AN FIELD to the seller by press enter with the input in focus
$(document).on('keyup', '#value_new_field_seller', function(e){
  if(e.keyCode == 13){
    if($(this).val() == ""){
      notifsTempo("Merci de remplir les champs", 4000, 'red');
      $(this).css({"border-color":"red"});
    }else {
      var seller_id = $(this).parent().parent().data("seller-id");
      var field_seller_name = $("#table_field_seller_" + seller_id).find("#name_new_field_seller").find(":selected").html();
      var content = $(this).val();
      $.ajax({
        url: '/sellers/'+seller_id+'/bind_field_seller',
        type: 'POST',
        dataType: 'script',
        data: {
          field_seller: {
            name: field_seller_name
          },
          content: content
        },
        error: function(jqXHR){
          notifsTempo(jqXHR.responseText, 4000, 'red');
        }
      });
    }
  }
});

// This is to ADD AN FIELD to the seller by click on the green button
$(document).on('click', '#create_new_field_seller', function(){
  var seller_id = $(this).parent().parent().data("seller-id");
  var field_seller_name = $("#table_field_seller_" + seller_id).find("#name_new_field_seller").find(":selected").html();
  var content = $("#table_field_seller_" + seller_id).find("#value_new_field_seller").val();
  if($("#table_field_seller_" + seller_id).find("#value_new_field_seller").val() == ""){
    notifsTempo("Merci de remplir les champs", 4000, 'red');
    $("#table_field_seller_" + seller_id).find("#value_new_field_seller").css({"border-color":"red"});
  }else {
    $.ajax({
      url: '/sellers/' + seller_id + '/bind_field_seller',
      type: "POST",
      dataType: 'script',
      data: {
        field_seller: {
          name: field_seller_name
        },
        content: content
      },
      error: function(jqXHR){
        notifsTempo(jqXHR.responseText, 4000, 'red');
      }
    });
  }
});

// This is to EDIT the state of the seller, active or inactive
// Using the DELETE method
$(document).on("click", "div.etatVendeur", function(){
  $.clicked = $(this);
  $.idSeller = $(this).parent().parent().attr("id");
  console.log($.idSeller);
  $.ajax({
    url: '/sellers/' + $.idSeller,
    type: "DELETE",
    dataType: 'script',
    success: function(){
      if($.clicked.children('label').css("left") == "3px"){
        $.clicked.children('label').css("left", "43px");
        $.clicked.children('input[type="checkbox"]').prop('checked', true);
      }else{
        $.clicked.children('label').css("left", "3px");
        $.clicked.children('input[type="checkbox"]').prop('checked', false);
      }
    },
    error: function(jqXHR){
      notifsTempo(jqXHR.responseText, 4000, 'red');
    }
  });
});

// This is to SHOW the INPUT to EDIT the name of the seller
$(document).on('click', '.seller_name', function(){
  $(this).removeClass('seller_name');
  $.dataSeller = $(this).children("h5").data("seller");
  $.h5Text = $(this).children("h5").html();
  $(this).children('img').addClass('save');
  $(this).children("h5").replaceWith('<h5 class="modal-title" data-seller=' + $.dataSeller + '><input class="form-control" id="seller_name_text"  type="text" value="' + $.h5Text + '"></h5>');
  $("#seller_name_text").focus();
});

// This is to EDIT the seller's name once the input it is focused and we press enter
$(document).on('keyup','#seller_name_text', function(e){
  if(e.keyCode == 13){
    $.this = $(this);
    $.finalText = $.this.val();
    $.this.parent("h5").parent("span").addClass('seller_name');

    if($.finalText == $.h5Text){
      $('img.save').removeClass('save');
      $.this.replaceWith($.h5Text);
    }else{
      if($.finalText == ""){
        notifsTempo("Merci de remplir le champ", 4000, 'red');
        $("#seller_name_text").css({"border-color":"red"});
      }else {
        $.ajax({
          url: '/sellers/'+$.dataSeller,
          type: 'PUT',
          dataType: 'script',
          data: {
            seller: {
              name: $.finalText
            }
          },
          success: function(jqXHR){
            $.this.parent("h5").parent("span").children('img').removeClass('save');
            $.this.parent("h5").replaceWith("<h5 class='modal-title' data-seller='" + $.dataSeller + "'>" + $.finalText + "</h5>");
            $("td[data-target='#modal_" + $.dataSeller + "']").replaceWith("<td data-toggle='modal' data-target='#modal_" + $.dataSeller + "'>" + $.finalText + "</td>");
          },
          error: function(jqXHR){
            $.this.parent("h5").parent("span").children('img').removeClass('save');
            $.this.parent("h5").replaceWith($.h5Text);
            $.this.parent("h5").parent("span").addClass('seller_name');
            notifsTempo(jqXHR.responseText, 4000, 'red');
          }
        });
      }
    }
  }
});

// Otherwise, if we FOCUSOUT the input without press enter, the seller's name has been inchanged
$(document).on('focusout', '#seller_name_text', function(){
  $(this).parent("h5").parent("span").addClass('seller_name');
  $(this).parent("h5").parent("span").children('img').removeClass('save');
  $(this).replaceWith($.h5Text)
});

// This is to ADD an type_material to the seller by press on the green button
$(document).on('click', '#bind_type_material', function(){
  var seller_id = $(this).parent().parent().data('seller-id');
  var type_material_name = $("#table_type_materials_sellers_" + seller_id).find("#name_new_type_material").find(':selected').html();
  $.ajax({
    url: "/sellers/" + seller_id + "/bind_type_material",
    type: "POST",
    dataType: 'script',
    data: {
      type_material: {
        name: type_material_name
      }
    },
    error: function(jqXHR){
      notifsTempo(jqXHR.responseText, 4000, 'red');
    }
  });
});

// This is to DELETE an type_material of the seller by press on the red button
$(document).on('click', '#unbind_type_material', function(){
  var seller_id = $(this).parent().parent().data("seller-id");
  var type_material_id = $(this).parent().parent().data("type-material");
  $.ajax({
    url: "/sellers/" + seller_id + "/unbind_type_material",
    type: "DELETE",
    dataType: 'script',
    data: {
      type_material: {
        id: type_material_id
      }
    },
    error: function(jqXHR){
      notifsTempo(jqXHR.responseText, 4000, 'red');
    }
  });
});


// This is to UPDATE AN FIELD of the seller by press enter with the input in focus
$(document).on('keyup', '#value_field_seller', function(e){
  if(e.keyCode == 13){
    var field_seller_id = $(this).parent().parent().data("field-seller-id");
    var seller_id = $(this).parent().parent().data("seller-id");
    var content = $(this).val();
    if($(this).val() == ""){
      notifsTempo("Merci de remplir le champ", 4000, 'red');
      $(this).css({"border-color":"red"});
    }else {
      $.ajax({
        url: '/sellers/' + seller_id + '/update_field_seller',
        type: "PUT",
        dataType: "script",
        data: {
          field_seller: {
            id: field_seller_id
          },
          content: content
        },
        error: function(jqXHR){
          notifsTempo(jqXHR.responseText, 4000, 'red');
        }
      });
    }
  }
});

// This is to DELETE an field_seller of the seller by press on the red button
$(document).on("click", "#unbind_field_seller", function(){
  var seller_id = $(this).parent().parent().data("seller-id");
  var field_seller_id = $(this).parent().parent().data("field-seller-id");
  $.ajax({
    url: '/sellers/' + seller_id + '/unbind_field_seller',
    type: 'DELETE',
    dataType: 'script',
    data: {
      field_seller: {
        id: field_seller_id
      }
    },
    error: function(jqXHR){
      notifsTempo(jqXHR.responseText, 4000, 'red');
    }
  });
});


$(document).on('click', '#add_new_seller', function(){
  $.this = $(this);
  var seller_name = $.this.parent().parent().children('td').children('input').val();
  $.ajax({
    url: '/sellers',
    type: 'POST',
    dataType: 'script',
    data: {
      seller: {
        name: seller_name,
        actif: true
      }
    },
    error: function(jqXHR){
      notifsTempo(jqXHR.responseText, 4000, 'red');
    }
  });
});


// This is of PERMANENT DELETION of the seller
$(document).on('click', '#delete_seller', function(){
  if(confirm('Êtes-vous sûr de vouloir supprimer ce vendeur ?')){
    $.ajax({
      url: "/sellers/" + $(this).data('seller-id') + "/permanent_deletion",
      type: "DELETE",
      error: function(jqXHR){
        notifsTempo(jqXHR.responseText, 4000, 'red');
      }
    });
  }else {
    alert("Non ? Parce que personnellement, je ne l'aime pas trop celui là...");
  }
});
