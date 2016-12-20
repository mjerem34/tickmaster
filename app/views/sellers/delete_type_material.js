$("tr[data-seller-id='<%= @seller.id %>'][data-type-material='<%= @type_material_id %>']").remove();
notifsTempo("Suppression réussie", 4000, "green");
