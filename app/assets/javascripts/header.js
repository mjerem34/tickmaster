function contrast() {
  $("#content").css("background", "url('app/assets/images/halftone.png') repeat fixed !important");
}


$(document).ready(function () {
  var url = document.URL;
  segments = url.split("/");
  var action = segments[3];
  var idAction = segments[4];
  var supplementAction = segments[5];
  switch (action) {
    case "users":
      if (jQuery.type(idAction) != "undefined" && (jQuery.type(supplementAction) === "undefined" || supplementAction === "to_treat" || supplementAction === 'allincidents')) {
        $(".active[data-target='#incidents']").removeClass('collapsed').attr('aria-expanded', true);
        $("#incidents").addClass('in').attr('aria-expanded', true);
      } else {
        $(".active[data-target='#users']").removeClass('collapsed').attr('aria-expanded', true);
        $("#users").addClass('in').attr('aria-expanded', true);
      }
      break;

    case "signup":
      $(".active[data-target='#users']").removeClass('collapsed').attr('aria-expanded', true);
      $("#users").addClass('in').attr('aria-expanded', true);
      break;

    case "incidents":
      $(".active[data-target='#incidents']").removeClass('collapsed').attr('aria-expanded', true);
      $("#incidents").addClass('in').attr('aria-expanded', true);
      break;

    case "categories":
      $(".active[data-target='#categories']").removeClass('collapsed').attr('aria-expanded', true);
      $("#categories").addClass('in').attr('aria-expanded', true);
      break;

    case "sous_categories":
      $(".active[data-target='#categories']").removeClass('collapsed').attr('aria-expanded', true);
      $("#categories").addClass('in').attr('aria-expanded', true);
      break;

    case "rights":
      $(".active[data-target='#rights']").removeClass('collapsed').attr('aria-expanded', true);
      $("#rights").addClass('in').attr('aria-expanded', true);
      break;

    case "agencies":
      $(".active[data-target='#agencies']").removeClass('collapsed').attr('aria-expanded', true);
      $("#agencies").addClass('in').attr('aria-expanded', true);
      break;
    case "procedures":
      $(".active[data-target='#procedures']").removeClass('collapsed').attr('aria-expanded', true);
      $("#procedures").addClass('in').attr('aria-expanded', true);
      break;
    case "materials":
    case "sellers":
    case "field_sellers":
    case "type_materials":
    case "spec_type_materials":
    case "spec_materials":
      $(".active[data-target='#material']").removeClass('collapsed').attr('aria-expanded', true);
      $("#material").addClass('in').attr('aria-expanded', true);
      break;
    case "pages":
      $(".active[data-target='#aide']").removeClass('collapsed').attr('aria-expanded', true);
      $("#aide").addClass('in').attr('aria-expanded', true);
      break;

    default:
      break;
  }
  $(".active[data-target='#incidents']").click(function () {
    $(".active[data-target='#categories']").addClass('collapsed').attr('aria-expanded', false);
    $("#categories").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#users']").addClass('collapsed').attr('aria-expanded', false);
    $("#users").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#rights']").addClass('collapsed').attr('aria-expanded', false);
    $("#rights").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#agencies']").addClass('collapsed').attr('aria-expanded', false);
    $("#agencies").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#material']").addClass('collapsed').attr('aria-expanded', false);
    $("#material").removeClass('in').attr('aria-expanded', false);

    $(".active[data-target='#procedures']").addClass('collapsed').attr('aria-expanded', false);
    $("#procedures").removeClass('in').attr('aria-expanded', false);

  });
  $(".active[data-target='#categories']").click(function () {
    $(".active[data-target='#incidents']").addClass('collapsed').attr('aria-expanded', false);
    $("#incidents").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#users']").addClass('collapsed').attr('aria-expanded', false);
    $("#users").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#rights']").addClass('collapsed').attr('aria-expanded', false);
    $("#rights").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#agencies']").addClass('collapsed').attr('aria-expanded', false);
    $("#agencies").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#material']").addClass('collapsed').attr('aria-expanded', false);
    $("#material").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#procedures']").addClass('collapsed').attr('aria-expanded', false);
    $("#procedures").removeClass('in').attr('aria-expanded', false);

  });
  $(".active[data-target='#users']").click(function () {
    $(".active[data-target='#categories']").addClass('collapsed').attr('aria-expanded', false);
    $("#categories").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#incidents']").addClass('collapsed').attr('aria-expanded', false);
    $("#incidents").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#rights']").addClass('collapsed').attr('aria-expanded', false);
    $("#rights").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#agencies']").addClass('collapsed').attr('aria-expanded', false);
    $("#agencies").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#material']").addClass('collapsed').attr('aria-expanded', false);
    $("#material").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#procedures']").addClass('collapsed').attr('aria-expanded', false);
    $("#procedures").removeClass('in').attr('aria-expanded', false);


  });
  $(".active[data-target='#rights']").click(function () {
    $(".active[data-target='#categories']").addClass('collapsed').attr('aria-expanded', false);
    $("#categories").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#users']").addClass('collapsed').attr('aria-expanded', false);
    $("#users").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#incidents']").addClass('collapsed').attr('aria-expanded', false);
    $("#incidents").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#agencies']").addClass('collapsed').attr('aria-expanded', false);
    $("#agencies").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#material']").addClass('collapsed').attr('aria-expanded', false);
    $("#material").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#procedures']").addClass('collapsed').attr('aria-expanded', false);
    $("#procedures").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#agencies']").addClass('collapsed').attr('aria-expanded', false);
    $("#agencies").removeClass('in').attr('aria-expanded', false);


  });
  $(".active[data-target='#agencies']").click(function () {
    $(".active[data-target='#categories']").addClass('collapsed').attr('aria-expanded', false);
    $("#categories").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#users']").addClass('collapsed').attr('aria-expanded', false);
    $("#users").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#rights']").addClass('collapsed').attr('aria-expanded', false);
    $("#rights").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#incidents']").addClass('collapsed').attr('aria-expanded', false);
    $("#incidents").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#material']").addClass('collapsed').attr('aria-expanded', false);
    $("#material").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#procedures']").addClass('collapsed').attr('aria-expanded', false);
    $("#procedures").removeClass('in').attr('aria-expanded', false);


  });
  $(".active[data-target='#procedures']").click(function () {
    $(".active[data-target='#categories']").addClass('collapsed').attr('aria-expanded', false);
    $("#categories").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#users']").addClass('collapsed').attr('aria-expanded', false);
    $("#users").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#rights']").addClass('collapsed').attr('aria-expanded', false);
    $("#rights").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#incidents']").addClass('collapsed').attr('aria-expanded', false);
    $("#incidents").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#material']").addClass('collapsed').attr('aria-expanded', false);
    $("#material").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#agencies']").addClass('collapsed').attr('aria-expanded', false);
    $("#agencies").removeClass('in').attr('aria-expanded', false);
  });
  $(".active[data-target='#material']").click(function () {
    $(".active[data-target='#categories']").addClass('collapsed').attr('aria-expanded', false);
    $("#categories").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#users']").addClass('collapsed').attr('aria-expanded', false);
    $("#users").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#rights']").addClass('collapsed').attr('aria-expanded', false);
    $("#rights").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#incidents']").addClass('collapsed').attr('aria-expanded', false);
    $("#incidents").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#procedures']").addClass('collapsed').attr('aria-expanded', false);
    $("#procedures").removeClass('in').attr('aria-expanded', false);
    $(".active[data-target='#agencies']").addClass('collapsed').attr('aria-expanded', false);
    $("#agencies").removeClass('in').attr('aria-expanded', false);

  });
});
