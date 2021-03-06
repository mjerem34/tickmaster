$(".cards-list-incidents").empty().append("
  <% @incidents.each do |incident| %>
    <% case incident.incident_state_id_for_tech.id %>
      <% when 1 %>
        <div class='col-md-4 card-incident' style='background: #f44336;'>
      <% when 2 %>
        <div class='col-md-4 card-incident' style='background: #4CAF50;'>
      <% when 4 %>
        <div class='col-md-4 card-incident' style='background: #FFEB3B; color:#212121;'>
      <% else %>
        <div class='col-md-4 card-incident' style='background: #335f87;'>
    <% end %>

      <div class='firstPart' onClick='document.location.href=`<%=edit_incident_path(incident)%>`'>
        <p> N°<%= incident.id %></p><br>
        <p class='hover-cellule' style='word-break: break-all;'>Objet : <b><%= truncate(incident.title, length: 70) %></b></p>
        <p class='hover-cellule' style='word-break: break-all;'>Contenu : <b><%= truncate(strip_tags(incident.content), length: 100)%></b></p>
        <p>Demandeur : <b><%= incident.user.name%> <%= incident.user.surname %></b></p>
        <% if incident.tech_id != nil %>
          <p>Technicien : <b><%= incident.tech.name %> <%= incident.tech.surname %></b></p>
        <% else %>
          <p>Technicien : <b>Technicien non défini ...</b></p>
          <% end %>
          </div>
          <div class='secondPart' onClick='document.location.href=`<%=edit_incident_path(incident)%>`'>
            <p>Catégorie : <b><%= incident.category.name %></b></p>
            <p>Sous-Categorie : <b><%= incident.sous_category.name%></p>
            <p>Date : <b><%= incident.created_at.strftime('%d %b %Y %H:%M')%></b></p>
            <p>Etat : <b><%= incident.incident_state_id_for_tech.shortcut %></b></p>
            <p>Urgence : <b><%= incident.lvl_urgence_user %></b></p>
          </div>
    </div>
  <% end %>
");
