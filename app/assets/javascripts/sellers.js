// This is to CREATE NEW SELLER by press enter with the input in focus
$(document).on('keyup', 'input#new_seller_name', function(e){
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
      var field_seller_name = $("#name_new_field_seller").find(":selected").html();
      var seller_id = $(this).parent().parent().data("seller-id");
      var content = $(this).val();
      $.ajax({
        url: '/sellers/'+seller_id+'/add_field_seller',
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
  var field_seller_name = $("#name_new_field_seller").find(":selected").html();
  var seller_id = $(this).parent().parent().data("seller-id");
  var content = $("#value_new_field_seller").parent().parent().children("td").children('input').val();
  if($("#value_new_field_seller").val() == ""){
    notifsTempo("Merci de remplir les champs", 4000, 'red');
    $("#value_new_field_seller").css({"border-color":"red"});
  }else {
    $.ajax({
      url: '/sellers/'+seller_id+'/add_field_seller',
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

// This is to edit the state of the seller, active or inactive
$(document).on("click", "div.etatVendeur", function(){
  $.clicked = $(this);
  var idSeller = $(this).children('input[type="checkbox"]').data("seller");
  $.ajax({
    url: '/sellers/' + idSeller,
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

// This is to show the input to edit the name of the seller
$(document).on('click', '.seller_name', function(){
  $(this).removeClass('seller_name');
  $.dataSeller = $(this).children("h5").data("seller");
  $.h5Text = $(this).children("h5").html();
  $(this).children('img').addClass('save');
  $(this).children("h5").replaceWith('<h5 class="modal-title" data-seller=' + $.dataSeller + '><input class="form-control" id="seller_name_text"  type="text" value="' + $.h5Text + '"></h5>');
  $("#seller_name_text").focus();
});

// This is to edit the seller's name once the input it is focused and we press enter
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

// Otherwise, if we focusout the input without press enter, the seller's name has been inchanged
$(document).on('focusout', '#seller_name_text', function(){
  $(this).parent("h5").parent("span").addClass('seller_name');
  $(this).parent("h5").parent("span").children('img').removeClass('save');
  $(this).replaceWith($.h5Text)
});

$(document).on('click', '#delete_type_material', function(){
  $.this = $(this);
  var sellerId = $(this).data("seller");
  var type_material_id = $(this).data("type_material");
  $.ajax({
    url: "/sellers/"+sellerId+"/delete_type_material",
    type: "DELETE",
    dataType: 'script',
    data: {
      type_material_id: type_material_id
    },
    success: function(){
      $.this.parent().parent().remove();
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

$(document).on("click", "button#delete_field_seller", function(){
  $.this = $(this);
  var seller_id = $.this.parent().parent().children("td").children('input').data("seller");
  var field_seller_id = $.this.parent().parent().children("td").children('input').data("field_seller");
  $.ajax({
    url: '/sellers/' + seller_id + '/delete_field_seller',
    type: 'DELETE',
    dataType: 'script',
    data: {
      field_seller_id: field_seller_id
    },
    success: function(){
      $.this.parent().parent().remove();
      notifsTempo("Suppression réussie", 4000, 'green');
    },
    error: function(jqXHR){
      notifsTempo(jqXHR.responseText, 4000, 'red');
    }
  });
});

$(document).on('click', 'button#add_new_seller', function(){
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
    success: function(){
      notifsTempo("Création réussie", 4000, 'green');
      location.reload();
    },
    error: function(jqXHR){
      notifsTempo(jqXHR.responseText, 4000, 'red');
    }
  });
});
