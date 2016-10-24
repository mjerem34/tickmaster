* Do like get_all_fields_sellers, remove those already defined in the list
* Faire le chemin à l'emplacement tu titre de la page Accueil > Utilisateurs > Yvon Partoo

Pour l'inscription, changer le controller, créer une nouvelle methode ou l'utilisateur qui veut s'inscrire va sur une methode et sera obligé de tout remplir et l'autre methode réservée pour les techniciens, DRH et autres


transformer fields_seller_sellers content en text au lieu de string

* Refonte
  * Utilisateurs
    * Vue
      * Enlever le form_new et faire la redirection dans le controller si tech ou user connecté ou pas
      * *show a réfléchir la disposition mais tous les champs doivent apparaitre*
    * Controller
        * L'index et le show doivent retourner les détails de l'utilisateur dans le controller (voir si possible de le mettre dans la meme variable)
  * Droits
    * Model
    * Vue
    * Controller
      * show doit renvoyer le nom et tous les types de user + affectations
  * Agences
    * Model
    * Vue
      * N'affiche que le nom, l'ip et le bouton ping dans l'index
      * Avec modal de details
    * Controller
      * index prend juste le nom et l'id
      * show prends les details de l'agence
      * delete supprime les champs associés (voir model)
      * controller pour les field_agencies
        * juste besoin d'une vue index pour les afficher et les créer dans la liste bouton +


* Type_users show liste les utilisateurs qui appartiennent au type

* Vérifier que tous les modèles ont des validates
* Vérifier que tous les modèles ont le validate uniqueness
Faire des verifications pour les champs, limiter a 254 caracteres exemple table field_type_user, les string
*

* Finir le fr.yml
* Voir pourquoi le fr.yml ne fonctionne pas avec les noms de modèles
