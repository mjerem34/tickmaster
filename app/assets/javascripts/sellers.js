$(document).on('click', '#add_type_material',function(){
  $.ajax({
    url: '/sellers/get_all_type_materials',
    type: 'GET',
    dataType: 'script',
    data: {
      seller_id: $(this).parent().parent().parent().data('sellerid')
    }
  });
});
$(document).on('click', '#add_field_seller',function(){
  $.ajax({
    url: '/sellers/get_all_field_sellers',
    type: 'GET',
    dataType: 'script',
    data: {
      seller_id: $(this).data('sellerid')
    }
  });
});
$(document).on('click', '#save_type_material', function(){
var name = $(this).parent().parent().children('td').children('select').children('option:selected').text();
var seller_id = $(this).parent().parent().parent().data('sellerid');
$.ajax({
  url: '/type_materials/rely_type_material_to_seller',
  type: 'POST',
  dataType: 'script',
  data: {
    type_material: {
      seller_id: seller_id,
      name: name
    }
  },
  success: function(result){
    var typeMatId = $("tbody[data-sellerid='" + seller_id + "'] > tr > td > select option").filter(function(){ return $(this).html() == name;}).val();
    var typeMatName = $("tbody[data-sellerid='" + seller_id + "'] > tr > td > select option").filter(function(){ return $(this).html() == name;}).text();
    $('tbody[data-sellerid="' + seller_id + '"] > tr').last().remove();
    $('tbody[data-sellerid="' + seller_id + '"]').append("<tr><td>" + typeMatName + "</td><td><button type='button' class='delete_type_material btn btn-danger' data-seller='" + seller_id + "' data-type_material='" + typeMatId + "'>-</button></td></tr><tr class='row_add_type_material'><td><button type='button' name='button' class='btn btn-success' id='add_type_material'>+</button></td><td></td></tr>");
  }
});
});
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
    error: function(result){
      alert(result.responseText);
    }
  });
});

$(document).on('click', '.seller_name', function(){
  $(this).removeClass('seller_name');
  $.dataSeller = $(this).children("h5").data("seller");
  $.h5Text = $(this).children("h5").html();
  $(this).children('img').addClass('save');
  $(this).children("h5").replaceWith('<h5 class="modal-title" data-seller=' + $.dataSeller + '><input class="form-control" id="seller_name_text"  type="text" value="' + $.h5Text + '"></h5>');
  $("#seller_name_text").focus();
});

$(document).on('keyup','#seller_name_text', function(e){
  if(e.keyCode == 13){
    $.this = $(this);
    $.finalText = $.this.val();
    $.this.parent("h5").parent("span").addClass('seller_name');

    if($.finalText == $.h5Text){
      $('img.save').removeClass('save');
      $.this.replaceWith($.h5Text);
    }else{
      $.ajax({
        url: '/sellers/'+$.dataSeller,
        type: 'PUT',
        dataType: 'script',
        data: {
          seller: {
            name: $.finalText
          }
        },
        success: function(result){
          $.this.parent("h5").parent("span").children('img').removeClass('save');
          $.this.parent("h5").replaceWith("<h5 class='modal-title' data-seller='" + $.dataSeller + "'>" + $.finalText + "</h5>");
          // $("td").find("[data-target='#" + $.dataSeller + "']").replaceWith("<td data-toggle='modal' data-target='" + $.dataSeller + "'>" + $.finalText + "</td>");
          $("td[data-target='#" + $.dataSeller + "']").replaceWith("<td data-toggle='modal' data-target='#" + $.dataSeller + "'>" + $.finalText + "</td>");
        },
        error: function(result){
          $.this.parent("h5").parent("span").children('img').removeClass('save');
          $.this.parent("h5").replaceWith($.h5Text);
          $.this.parent("h5").parent("span").addClass('seller_name');
          alert(result.responseText);
        }
      });
    }
  }
});
$(document).on('focusout', '#seller_name_text', function(){
  $(this).parent("h5").parent("span").addClass('seller_name');
  $(this).parent("h5").parent("span").children('img').removeClass('save');
  $(this).replaceWith($.h5Text)
});
$(document).on('click', 'button.delete_type_material', function(){
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
    error: function(result){
      alert(result.responseText);
    }
  });
});

$(document).on('keyup', '#new_field_seller_input', function(e){
  if(e.keyCode == 13){
    $.this = $(this);
    var field_seller_name = $(this).parent().parent().children("td").children('select').children("option:selected").html();
    var seller_id = $(this).data("seller");
    var field_seller_id = $(this).parent().parent().children("td").children('select').val();
    var content = $(this).val();
    $.ajax({
      url: '/sellers/'+seller_id+'/add_field_seller',
      type: "POST",
      dataType: 'script',
      data: {
        field_seller_id: field_seller_id,
        field_seller_name: field_seller_name,
        content: content
      },
      success: function(result){
        $.this.parent().parent().replaceWith("<tr><td>" + field_seller_name + "</td><td><input type='text' data-seller='" + seller_id + "' data-field_seller='" + result + "' name='valueFieldSeller' class='form-control value-field-seller' value='" + content + "'/></td><td><button type='button' name='delete_field_seller' class='btn btn-danger' id='delete_field_seller'>-</button></td></tr><tr><td><button data-sellerid='" + seller_id + "' type='button' name='button' class='btn btn-success' id='add_field_seller'>+</button><affic/td><td></td></tr>");
      },
      error: function(result){
        alert(result.responseText);
      }
    });
  }
});

$(document).on('click', 'button#save_field_seller', function(){
  $.this = $(this);
  var field_seller_name = $(this).parent().parent().children("td").children('select').children("option:selected").html();
  var seller_id = $(this).parent().parent().children("td").children('input').data("seller");
  var field_seller_id = $(this).parent().parent().children("td").children('select').val();
  var content = $(this).parent().parent().children("td").children('input').val();
  $.ajax({
    url: '/sellers/'+seller_id+'/add_field_seller',
    type: "POST",
    dataType: 'script',
    data: {
      field_seller_id: field_seller_id,
      field_seller_name: field_seller_name,
      content: content
    },
    success: function(result){
      $.this.parent().parent().replaceWith("<tr><td>" + field_seller_name + "</td><td><input type='text' data-seller='" + seller_id + "' data-field_seller='" + result + "' name='valueFieldSeller' class='form-control value-field-seller' value='" + content + "'/></td><td><button type='button' name='delete_field_seller' class='btn btn-danger' id='delete_field_seller'>-</button></td></tr><tr><td><button data-sellerid='" + seller_id + "' type='button' name='button' class='btn btn-success' id='add_field_seller'>+</button><affic/td><td></td></tr>");
    },
    error: function(result){
      alert(result.responseText);
    }
  });
});

$(document).on('keyup', '.value-field-seller', function(e){
  if(e.keyCode == 13){
    var field_seller_id = $(this).data("field_seller");
    var seller_id = $(this).data("seller");
    var content = $(this).val();
    $.ajax({
      url: '/sellers/' + seller_id + '/update_field_seller',
      type: "PUT",
      dataType: "script",
      data: {
        field_seller_id: field_seller_id,
        content: content
      },
      error: function(result){
        alert(result.responseText);
      }
    });
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
    },
    error: function(result){
      alert(result.responseText);
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
    success: function(seller_id){
      location.reload();
      // Ce qui suit est pour si pas besoin du reload, ça génère directement la ligne, mais pas le modal du vendeur donc vaut mieux faire un reload comme ça le modal est généré.
      // $.this.parent().parent().replaceWith("<tr><td>" + seller_name + "</td><td><div class='slideThree etatVendeur'><input class='form-control' type='checkbox' data-seller='" + seller_id + "' value='actif' checked><label for='checkbox-right'></label></div></td></tr>");
    },
    error: function(result){
      alert(result.responseText);
    }
  });
});

$(document).on('keyup', 'input#new_seller_name', function(e){
  if(e.keyCode == 13){
    $(this).focusout();
    $.this = $(this);
    var seller_name = $.this.val();
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
      success: function(seller_id){
        location.reload();
        // Ce qui suit est pour si pas besoin du reload, ça génère directement la ligne, mais pas le modal du vendeur donc vaut mieux faire un reload comme ça le modal est généré.
        // $.this.parent().parent().replaceWith("<tr><td>" + seller_name + "</td><td><div class='slideThree etatVendeur'><input class='form-control' type='checkbox' data-seller='" + seller_id + "' value='actif' checked><label for='checkbox-right'></label></div></td></tr>");
      },
      error: function(result){
        alert(result.responseText);
      }
    });
  }
});
