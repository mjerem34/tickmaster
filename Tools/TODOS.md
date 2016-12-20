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
* Pour tous les champs dans tous les controllers n-n, pouvoir trier par exemple pour un type de caracteristique technique "Type d'immobilisation", pouvoir sortir tous les "Ordinateur" ou "Téléphone"
* Pouvoir faire un graphique a partir de chiffres
* Quand on clique sur les messages envoyés, il faut cliquer sur le contenu pour ouvrir le modal, changer pour que ça l'ouvre quand on clique sur toute la ligne

* unnasign_field_type_users sert a rien ?
* resoudre bug user.tech_id dans new#material
* Faire la methode delete de type_user pour supprimer le type, doit verif si pas de user
*
* Controllers :
  * json :
    * Agences :
      * Index :
        * Prends juste le nom et l'ip
      * Show :
        * Prends toutes les infos de l'agence



* Pour lundi :
  * Continuer sur la page index#sellers
    * Il faut encore pouvoir supprimer les champs, ajout et modif ok, meme en direct
    * Faire les types de matériels
    * Faire que le modal se charge directement à la création du vendeur sans reload la page (easy, copier coller)
