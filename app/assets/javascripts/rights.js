$(document).ready(function(){
  $('input[type="radio"]:nth-child(1)').click();
  $(document).on('click', '.slideThree', function(){
    var checked = $(this).children('input[type="checkbox"]').is(":checked");
    var type_user = $(this).children('input[type="checkbox"]').data("id");
    var right = $(this).children('input[type="checkbox"]').val();
    $.clicked = $(this);
    $.ajax({
      url: '/type_users/' + type_user + '/toggle',
      type: 'PATCH',
      dataType: 'json',
      data: {
        right_id:right,
        checked:!checked
      },
      success: function(result){
        if($.clicked.children('label').css("left") == "3px"){
          $.clicked.children('label').css("left", "43px");
          $.clicked.children('input[type="checkbox"]').prop('checked', true);
        }else{
          $.clicked.children('label').css("left", "3px");
          $.clicked.children('input[type="checkbox"]').prop('checked', false);
        }
      }
    });
  });
});
