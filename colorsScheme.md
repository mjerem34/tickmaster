<!-- Technicien -->

1 - En attente de prise en charge : #e74c3c
2 - Affecté à un technicien : #e74c3c
3 - Pris en charge par un technicien : #e74c3c
4 - Réponse reçue : #e74c3c
5 - En attente de réponse du demandeur : #2ecc71
7 - Incident cloturé : #2c3e50
9 - Demande de cloture envoyée, en attente : #2c3e50
10 - Incident rejeté : #2c3e50
11 - Incident pris en charge par un technicien supérieur : #2ecc71
12 - Incident en attente de réponse pour prise en charge par un technicien supérieur : #2ecc71

<!-- Utilisateur -->
1 - En attente de prise en charge : #2ecc71
2 - Affecté à un technicien : #2ecc71
3 - Pris en charge par un technicien : #2ecc71
4 - Réponse reçue : #e74c3c
6 - En attente de réponse du technicien : #2ecc71
7 - Incident cloturé : #2c3e50
8 - En attente de cloture de la part du demandeur : #e74c3c
10 - Incident rejeté : #2c3e50
11 - Incident pris en charge par un technicien supérieur : #2c3e50
12 - Incident en attente de réponse pour prise en charge par un technicien supérieur : #2ecc71


<% if current_user.tech.simple_user == false %>
<% case incident.incident_state_id_for_tech.id %>
<% when 1, 2, 3, 4 %>
<tr style=" background: #e74c3c;" data-toggle="modal" data-target="#<%= incident.id %>">
  <% when 5, 11, 12 %>
  <tr style="background: #2ecc71;" data-toggle="modal" data-target="#<%= incident.id %>">
    <% when 7, 9, 10 %>
    <tr style="background: #2c3e50;" data-toggle="modal" data-target="#<%= incident.id %>">
    <% else %>
      <tr style="background: #2c3e50;" data-toggle="modal" data-target="#<%= incident.id %>">
        <% end %>
      <% else %>
        <% case incident.incident_state_id_for_user.id %>
        <% when  4, 8 %>
        <tr style=" background: #e74c3c;" data-toggle="modal" data-target="#<%= incident.id %>">
          <% when 1, 2, 3, 6, 12 %>
          <tr style="background: #2ecc71;" data-toggle="modal" data-target="#<%= incident.id %>">
            <% when 7, 10 %>
            <tr style="background: #2c3e50;" data-toggle="modal" data-target="#<%= incident.id %>">
            <% else %>
              <tr style="background: #2c3e50;" data-toggle="modal" data-target="#<%= incident.id %>">

                <% end %>
                <% end %>
