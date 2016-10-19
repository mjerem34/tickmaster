* Do like get_all_fields_sellers, remove those already defined in the list
* Faire le chemin à l'emplacement tu titre de la page Accueil > Utilisateurs > Yvon Partoo

Pour l'inscription, changer le controller, créer une nouvelle methode ou l'utilisateur qui veut s'inscrire va sur une methode et sera obligé de tout remplir et l'autre methode réservée pour les techniciens, DRH et autres

Faire des verifications pour les champs, limiter a 254 caracteres exemple table field_type_user, les string

transformer fields_seller_sellers content en text au lieu de string

* Refonte
  * Utilisateurs
    * Model
      <!-- * Modifier modèle actuel -->
      <!-- * Enlever les champs à enlever -->
      <!-- * Enlever les validates inutiles -->
      <!-- * IDEM before_save -->
      <!-- * Créer modèles -->
      <!-- * fields_users -->
      <!-- * field_type_users -->
      <!-- * type_users -->
      <!-- * Faire les liens dans les nouveaux modèles -->
      <!-- * field_users has_many type_users through field_type_users -->
      <!-- * field_users has_many field_type_users -->
      <!-- * type_users has_many field_type_users -->
      <!-- * type_users has_many field_users through field_type_users -->
      <!-- * field_type_users belongs_to type_users -->
      <!-- * field_type_users belongs_to field_users -->
      <!-- * field_users belongs_to user -->
    * Vue
      * Enlever le form_new et faire la redirection dans le controller si tech ou user connecté ou pas
      * profil remettre dans edit
      * *show a réfléchir la disposition mais tous les champs doivent apparaitre*
      * index voir uniquement :
        * pseudo
        * mail
        * tel
        * agence
        * type_user
    * Controller
        <!-- * user_params -->
        <!-- * destroy supprime aussi les champs dépendants (voir pour le mettre dans le modèle automatiquement) -->
        * Faire deux new pour inscription par user et par tech
        <!-- * Voir pour la def check -->
        * L'index et le show doivent retourner les détails de l'utilisateur dans le controller (voir si possible de le mettre dans la meme variable)
        <!-- * besoin de controller pour type_users -->
        <!-- * besoin de controller pour field_type_users -->
        * Ajouter la méthode pour désactiver ou réactiver l'utilisateur
          <!-- * Faire la route en GET avec juste vérif des droits -->
  * Droits
    <!-- * créer tous les types d'utilisateurs -->
    <!-- * transférer tous les droits -->
    * Model
      <!-- * Modifier modèle actuel, enlever les champs -->
      <!-- * Créer modèle -->
      <!-- * type_users_rights -->
      <!-- * Faire le lien pour le modèle type_users_rights -->
    * Vue
      * Faire une vue avec liste des droits et une vue avec liste des type d'utilisateurs et modal
      * Modifier toutes les demandes de droits dans les vues voire les enlever quarément si possible
      * Modifier aussi demande de droit dans app_controller
    * Controller
      <!-- * Index doit renvoyer uniquement les droits et pas leurs affectations -->
      * show doit renvoyer le nom et tous les types de user + affectations
      * (ne peux pas créer un droit) mais on peux créer un nouveau profil et lui affecter les droits en mm temps : {"type_users":"Nouveau", "rights":{0:true,1:false,2:true}}
  * Agences
    * Model
      <!-- * Enlever champs inutiles -->
      <!-- * Créer tables  -->
      <!-- * Faire liaisons -->
    * Vue
      * N'affiche que le nom, l'ip et le bouton ping dans l'index
      * Avec modal de details
    * Controller
      * index prend juste le nom et l'id
      * show prends les details de l'agence
      * delete supprime les champs associés (voir model)
      * controller pour les field_agencies
        * juste besoin d'une vue index pour les afficher et les créer dans la liste bouton +


* Créer les droits pour index/show/new/delete/update type_user
* Type_users index liste avec à la fin un champ pour ajouter avec cocher si mot de passe ou si c'est un tech
* Type_users show liste les utilisateurs qui appartiennent au type
* Mettre un modal pour editer le type
* Destroy doit juste désactiver le type et ne plus le proposer



Pensées :
