$(function(){
  $('.dropdownSearch').selectize({selectOnTab: true, closeAfterSelect: true, placeholder: "Merci de sélectionner une valeur" });
  $('.dropdownSearchCreate').selectize({create: true, persist: false, createOnBlur: true, closeAfterSelect: true, placeholder: "Merci de sélectionner une valeur"});
});
