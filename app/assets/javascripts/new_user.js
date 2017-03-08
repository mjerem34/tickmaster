$(document).ready(function(){
  $("#user_password").hide();
  $("#user_password").val(' ');
  $(document).on('change', '#user_type_user_id', function(){
    if ($(this).children('option:selected').data('password') == true){
      $("#user_password").show(250);
      $("#user_password").val('');
      $('.br-to-remove').remove();
      $("#user_password").before("<br class='br-to-remove'>");
    }else{
      $("#user_password").hide(250);
      $("#user_password").val('');
      $('.br-to-remove').remove();
    }
  });

  $("#postmail").change(function(){
    $("#postmail").options.selected=true;
  });

  $("#user_email").val($("#user_email").val().slice(0, $("#user_email").val().indexOf("@")))
  $("#sendButton").click(function(){
    if ($("#user_email").val().indexOf("@") > -1){
      $("#user_email").val($("#user_email").val().slice(0, $("#user_email").val().indexOf("@")))
      $("#user_email").val($("#user_email").val() + $("#postmail").val());
    }else{
      $("#user_email").val($("#user_email").val() + $("#postmail").val());
    }
  });
  $("#user_surname").change(function () {
    $("#user_email").val($("#user_surname").val().toLowerCase());
    $("#user_email").val(removeDiacritics($("#user_email").val()));
    $("#user_pseudo").val($("#user_surname").val().toLowerCase());
    $("#user_pseudo").val(removeDiacritics($("#user_pseudo").val()));
  });
  $("#user_name").change(function () {
    $("#user_email").val($("#user_email").val() + "." + $("#user_name").val().toLowerCase());
    $("#user_email").val(removeDiacritics($("#user_email").val()));
    $("#user_pseudo").val($("#user_pseudo").val() + "." + $("#user_name").val().toLowerCase());
    $("#user_pseudo").val(removeDiacritics($("#user_pseudo").val()));
  });
});

function verif_nombre(champ)
{
  var chiffres = new RegExp("[0-9]");
  var verif;
  var points = 0;

  for(x = 0; x < champ.value.length; x++)
  {
    verif = chiffres.test(champ.value.charAt(x));
    if(champ.value.charAt(x) == "."){points++;}
    if(points > 1){verif = false; points = 1;}
    if(verif == false){champ.value = champ.value.substr(0,x) + champ.value.substr(x+1,champ.value.length-x+1); x--;}
  }
}
