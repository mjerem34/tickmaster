Ajouter tous les champs supplémentaires automatiquement
- Sauf les condentiels
qui seront a remplir par la RH
Plutôt les mettre dans le prol,
à remplir plus tard
Faire intégration des images pour les utilisateurs
Ajouter "information condentielle"
Ou alors mettre des niveaux de condentialité
Dans les champs utilisateurs, mettre une case "crypter le champ"
Cryptage
Dans la table eld_user
:
id : reste normal
eld_type_user_id:
hashé : hash(eld_type_user_id,
"motdepassegénérique")
user_id : hashé : hash(user_id, "motdepassegénérique")
Par exemple pour eld_user
(qui contiendra les données privées des utilisateurs) on
peux hasher les foreign_key
Du coup pour :
stringToCrypt = "Hello World"
password = unhash("1fse54fg86sdr4fse534rsd6gdsr4gdr64g4drg4d165rd465g4")
env_var = ENV_VAR["crypt"]
AES(stringToCrypt, password + env_var)
Le SHA-256 dans le code + une chaine aléatoire de 32 carac en HEXA(?) pour crypter les
données ?
Un hash SHA-256 écrit en dur dans le code dont le mot de passe servirait a
crypter/décrypter les données => personne ne peut les décrypter sans connaitre le mot
de passe, même pas un hacker
Un hash en SHA-256, écrit en dur dans le code ? Moins dangereux
Peut être un mot de passe écrit en dur ? Trop dangereux
Besoin que l'administrateur puisse avoir accès aux informations condentielles
aussi
Mais dans ce cas seul l'utilisateur pourra avoir accès a ces informations lorsqu'il se
connectera
Se servir du mot de passe en clair de l'utilisateur pour crypter tout
OU
Se servir du mot de passe crypter de l'utilisateur pour sel de cryptage oO
Prol
utilisateur
Créer un utilitaire pour les notications
Jeremy M. 1 Juin 08:10
Enlever le service objet SendNotication
Jeremy M. 1 Juin 08:10
Et créer une classe dans util >> class Notification
CLOTURE
REJECT
Tests des controlleurs
Congurer
exception notication
Jeremy M. 18 Avr 23:43
Voir si il faut pas rajouter le MDP pour que les emails s'envoient
Ajouter notications
Jeremy M. 1 Juin 17:27
Une nouvelle table 'Notications'
Jeremy M. 1 Juin 17:39
id : int
user_id : int
title : string
created_at : datetime
readed_at : datetime
Jeremy M. 1 Juin 17:41
Demander à J si on purge ou si on garde tout (traces)
Procédures
Mettre en place reset du mot de passe
TypeUsers déplacer les .js en .json
A FAIRE
Liste des agences
Vérier
le graphique
Quand deux pings simultanés
1 ping a 24, envoie
1 ping a 26, envoie
2 ping a 25, envoie
du coup
On doit supprimer le point qui pose probleme (là ou la l'heure n'est pas au même
index partout)
Donc si pour un index donné
perols[4] = 13:35:25
plutot verier
pour chaque index que la donnee est identique a tous
si au moins un index n'est pas indentique
on supprime tout les index
Dans le modal, mettre les informations de l'agence à partir de "champs agence"
X Le bouton PING ne marche plus X Vérier
le bouton stop X Pinger toutes les agences ne fonctionne plus X Vérier
le bouton Stopper
Mettre que on puisse rendre visible les champs uniquement par des
administrateurs ou non (0/1)
Types de matériels
Mettre un lien vers la liste des vendeurs dans la notication
et écrire quel
vendeur possède ce type de matériel en vente
Quand on clique sur le bouton rouge ça ouvre la modal
Pouvoir faire en sorte qu'on puisse modier
les types de matériels au lieu de les
supprimer et les recréer (dans le modal)
Bloquer les doublons
Le généré en JS ne bug pas quand on supprime (n'ouvre pas le modal)
On ne peux pas supprimer les types de caractéristiques techniques dans le type
de matériel
1: http://thinkdi.net/mysql/encrypt-mysql-data-using-aes-techniques/
2: https://www.symantec.com/connect/articles/secure-mysql-database-design
