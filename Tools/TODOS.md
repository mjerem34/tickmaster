* Faire le chemin à l'emplacement tu titre de la page Accueil > Utilisateurs > Yvon Partoo
* Pour l'inscription, changer le controller, créer une nouvelle methode ou l'utilisateur qui veut s'inscrire va sur une methode et sera obligé de tout remplir et l'autre methode réservée pour les techniciens, DRH et autres
* Vérifier que tous les modèles ont des validates
* Vérifier que tous les modèles ont le validate uniqueness
* Finir le fr.yml
* Voir pourquoi le fr.yml ne fonctionne pas avec les noms de modèles
* Header, faire que quand ouvre un ça ferme les autres
* Users: Enlever le form_new et faire la redirection dans le controller si tech ou user connecté ou pas
* Users: *show a réfléchir la disposition mais tous les champs doivent apparaitre*
* users_controller L'index et le show doivent retourner les détails de l'utilisateur dans le controller (voir si possible de le mettre dans la meme variable)
* right_controller show doit renvoyer le nom et tous les types de user + affectations
* index#agencies Faire comme les matériels, table avec les champs et pouvoir modifier direct
* field_agencies_controller juste besoin d'une vue index pour les afficher et les créer dans la liste bouton +

* unnasign_field_type_users sert a rien ?
* Faire le index#type_materials (voir index#fields_sellers)
* Faire le index#spec_type_materials (voir index#fields_sellers)
* resoudre bug user.tech_id dans new#material
* Faire le index#specs_materials (voir index#fields_sellers)
*
* Controllers :
  * json :
    * Agences :
      * Index :
        * Prends juste le nom et l'ip
      * Show :
        * Prends toutes les infos de l'agence
    * type_users :
      * index
        * Renvoi les champs présents
      * A supprimer
        * show
        * edit
        * new
      *
