Créer une agence :

{"name":"CLE BAeeeeYeONNE","adress":"50 route deeeee Maignon","adress2":"NULL","adress3":"NULL","cp":"64600","city":"ANGLET","email":"bayonne@cle-expertises.fr","tel":"0559292182","fax":"0551150670","department":"Pyrénées Atlantiques","ip_adress":"8.8.8.8"}


---


Créer un incident :

{"title":"ss","content":"<p>sssss</p>","user_id":11,"tech_id": null,"category_id": 1,"sous_category_id": 14,"agency_id": 7,"lvl_urgence_user": 1,"lvl_urgence_tech": 1,"cloture_user": null,"cloture_tech": null,"pc_id": null,"ip_adress": "127.0.0.1","solution": null,"keywords": null,"link_faq": null,"incident_state_id_for_user_id": 1,"incident_state_id_for_tech_id": 1,"lvl_of_incident": 1,"archived_at": null,"resolved_at": null,"attach_file_name": null,"attach_content_type": null,"attach_file_size": null,"attach_updated_at": null,"created_at": "2016-07-25T09:54:00.000+02:00","updated_at": "2016-07-25T09:54:00.000+02:00","notify_for_tech": true,"notify_for_user": false}


---

Reaffecter, Cloture, Rejeter un incident :

{"commit":"Réaffecter", "response":{"content":"dsefzsefsfefseefesf"}}

---

Répondre à un msg d'un incident :
{"commit":"Valider", "response":{"content":"dsefzsefsfefseefesf"}}


---

Créer un utilisateur :

{"pseudo": "jeromedd.guillot", "email": "bujghuikhgidshilfhizsefh@yopmail.com", "tel": "0683039620", "mobile": "", "name": "Guillot", "surname": "Jérôme", "password": "sonya88", "salt": "", "tech_id": 5, "attach_file_name": "", "attach_content_type": "", "attach_file_size": 0, "attach_updated_at": null, "agency_id": 2, "created_at": "2015-12-09T10:47:39.000+01:00", "updated_at": "2016-07-20T14:58:53.000+02:00", "mode": "Nuit", "ip_addr": "192.168.10.48"}


---

Créer procedure :

{"nom": "Fusion","contenu": "<p>Bonjour,</p> <p>La fusion avec lintervenant ne se fait pas.(1 intervenant sur les).</p> <p>Message :</p> <p>Le filtre graphique ne parvient pas  convertir le fichier (<a href= - Erreur non s</p> <p>Merci</p> ","resolution": "<p>Bonjour,</p> <p>est le fichier signature qust pas bon, pour le refaire, changer le signataire dans longletral et remettez ensuite le bon expert, le fichier sera reconstruit et vos documents fusionneront.</p> ","category_id": 1,"sous_category_id": 38}


---

Créer Cat :
{"name":"Yay"}

---

Créer sous cat :

{"name":"Messagerie","category_id":3,"lvl_urgence_max":10}


---

Créer droit :

{"name":"view_index_users","content":"Autorisé à voir la liste des utilisateurs","user":false,"tech":true,"super_tech":true,"admin":true,"disp":true,"assistant":true,"expert":true,"comptable":true}

---

Créer DetentorTypesController :

{"name": "Test"}

---

Créer FieldSellers :

{"name": "Test"}

---

Créer MaterialsController :

{"type_material_id": 1,"detentor_type_id": 1,"detentor_id": 1,"seller_id": 1,"date": null}

---

Créer SellersController :
Un vendeur n'a aucune valeur dans sa table, tout est présent dans une autre table reliée avec une clé étrangère.
{}

---

Créer SpecMaterialsController :
{"spec_type_material_id":"1"}

---

Créer SpecTypeMaterialsController :
{"name":"Test"}


---

Créer TypeMaterialsController :
{"name":"Test"}

---

Créer UpdatesController :

{"changesMade": "Correction de trucs "}


---

Créer un matériel (avec tout ce qu'on a besoin) :

{
  "material":
    {
      "type_material_id":"1"
    },
  "seller_id":"1",
  "detentor_type_id":"2",
  "detentor_id":"14",
  "seller_specs":
    {
      "Nom":"Samsung",
      "Adresse":"Domaine de la tour, Nébian",
      "Code postal":"fsef",
      "Ville":"esfes",
      "sfesfsef":"fsezfe"
    },
  "specs_values":
    {
    "Numéro de série":",opk,op",
    "Processeur":"k,opk",
    "Mémoire vive":"pklplojoij",
    "Mémoire de stockage":"ojpo",
    "Carte graphique":"kok",
    "Interface réseau":"nuibnio",
    "Carte mère":"sefsf",
    "fefgsdgfrg":"sefesfsefes"
    }
}



---


Se connecter :

{
  "session":{
    "pseudo":"jm",
    "password":""
  }
}


---

Créer un type utilisateur avec les droits (rajouter les droits si il y en a pluss dans la base)

{
  "type_user_name": "Responsableeeee", "secure": "false", "is_tech": "false", "actif": "true",
  "rights": {
    "1": "false",
    "2": "false",
    "3": "false",
    "5": "false",
    "6": "false",
    "7": "false",
    "8": "true",
    "9": "false",
    "10": "false",
    "11": "false",
    "12": "false",
    "13": "false",
    "14": "false",
    "15": "true",
    "16": "false",
    "17": "false",
    "18": "false",
    "19": "false",
    "20": "true",
    "21": "false",
    "22": "false",
    "23": "false",
    "24": "false",
    "25": "false",
    "26": "false",
    "27": "false",
    "28": "false",
    "29": "false",
    "30": "false",
    "31": "false",
    "32": "false",
    "33": "true",
    "34": "false",
    "35": "false",
    "37": "false",
    "38": "false",
    "39": "true",
    "40": "false",
    "41": "false",
    "42": "false",
    "43": "false",
    "44": "false",
    "45": "false",
    "46": "false",
    "47": "false",
    "48": "false",
    "49": "false",
    "50": "false",
    "51": "true",
    "52": "false",
    "53": "true",
    "54": "false",
    "55": "false",
    "56": "false",
    "57": "false",
    "58": "false",
    "59": "false",
    "60": "false",
    "61": "false",
    "62": "false",
    "63": "false",
    "64": "false",
    "65": "false",
    "66": "false",
    "67": "false",
    "68": "false",
    "69": "false",
    "70": "false",
    "71": "false",
    "72": "false",
    "73": "false",
    "74": "false",
    "75": "false",
    "76": "true",
    "77": "false",
    "78": "false",
    "79": "false",
    "80": "false",
    "81": "false",
    "82": "false",
    "83": "false",
    "84": "false",
    "85": "false",
    "86": "false",
    "87": "false",
    "88": "false",
    "89": "false",
    "90": "false",
    "91": "false",
    "92": "true",
    "93": "false"
  }
}



---


Modifier un type utilisateur :

{
  "type_user": {
    "name": "Modifier ici",
    "secure": "false",
    "is_tech": "false",
    "actif": "false"
    }
}
