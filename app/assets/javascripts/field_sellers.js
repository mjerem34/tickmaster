// This is for UPDATE on press enter in the input
$(document).on('keyup', '#name_field_seller', function(e){
  if(e.keyCode == 13 && $(this).val() != ""){
    $.ajax({
      url: '/field_sellers/' + $(this).parent('td').parent('tr').attr('id'),
      type: 'PUT',
      dataType: 'script',
      data: {
        field_seller: {
          name: $(this).val()
        }
      },
      error: function(result){
        notifsTempo(result.responseText, 4000, 'red');
      }
    });
  }
});

// This is for DELETE on click on the red button
$(document).on('click', '#delete_field_sellers', function(){
  $.ajax({
    url: '/field_sellers/' + $(this).parent('td').parent('tr').attr('id'),
    type: 'DELETE',
    error: function(result){
      notifsTempo(result.responseText, 4000, 'red');
    }
  });
});

// This is for CREATE on click on the green button
$(document).on('click', 'button#add_field_seller', function(){
  var name = $('#name_new_field_seller').val();
  if(name == ""){
    notifsTempo("Merci de remplir le champ 'Nom du champ'", 4000, 'red');
  }else{
    $.ajax({
      url: '/field_sellers',
      type: 'POST',
      dataType: 'script',
      data: {
        field_seller: {
          name: name
        }
      },
      error: function(result){
        notifsTempo(result.responseText, 4000, 'red');
      }
    });
  }
});

// This is for CREATE on press enter on the input
$(document).on('keyup', '#name_new_field_seller', function(e){
  if(e.keyCode == 13){
    var name = $(this).val();
    if(name == ""){
      notifsTempo("Merci de remplir le champ 'Nom du champ'", 4000, 'red');
    }else{
      $.ajax({
        url: '/field_sellers/',
        type: 'POST',
        dataType: 'script',
        data: {
          field_seller: {
            name: name
          }
        },
        error: function(result){
          notifsTempo(result.responseText, 4000, 'red');
        }
      });
    }
  }
});
