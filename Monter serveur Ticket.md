Créer un user nommé ticket à l'installation
A faire après l'installation, avant le redémarrage.

---

LEXIQUE :
* <= A faire
`$ ` <= Commandes

---

* Démarrer en root
* `$ usermod -a -G sudo [ticket]`
* `$ reboot`
* `$ sudo nano /etc/apt/sources.list` <= Commenter les emplacements CD
* `$ sudo aptitude install apt-transport-https ca-certificates -y`
* `$ sudo aptitute install gnome-terminal -y`
* A PARTIR D'ICI REALISER TOUTES LES COMMANDES SOUS LE 'GNOME-TERMINAL'
* `$ sudo aptitude install gdebi -y`
* `$ sudo aptitude install build-essential git-core curl -y`
* `$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3`
* `$ \curl -sSL https://get.rvm.io | bash -s stable --ruby --rails`
* `$ [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"`
* `$ source ~/.profile`
* `$ exit`
* `$ rvm use 2.2 --default`
* `$ ruby -v` <= devrait afficher la version de ruby si bien installé
* `$ chown -R /usr/local/rvm/`
* `$ sudo apt-get install mysql-server mysql-client libmysqlclient-dev -y`
* `$ sudo apt-get install imagemagick -y`
* `$ git clone https://framagit.org/EXPERTISES/tickmaster.git `
* `$ sudo aptitude install nginx -y`
* `$ sudo apt-get install libcurl4-openssl-dev -y`
* `$ cd Bureau\tickmaster`
* `$ bundle`
* `$ sudo add-apt-repository ppa:webupd8team/sublime-text-2 && sudo apt-get update && sudo apt-get install sublime-text -y`
* `$ sudo ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /bin/subl`
* `$ rake db:create --trace && rake db:migrate --trace`
* `$ sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7`
* `$ sudo nano /etc/nginx/sites-available/default` <= Commenter toutes les lignes
* `$ sudo nano /etc/nginx/sites-available/ticket`
  * Remplir avec ceci :
* `$ sudo ln -s /etc/nginx/sites-available/ticket /etc/nginx/sites-enabled/ticket -f`
* `$ sudo subl /etc/nginx/nginx.conf`
  * Remplir avec ceci :
* `$ sudo service nginx restart`
* `$ sudo nano /etc/mysql/my.cnf` #comment out bind_adress line
* `$ sudo service mysql restart`
* `$ mysql -u root -p`
* `$ GRANT ALL PRIVILEGES ON Tickets_production.* TO ticket IDENTIFIED BY 'Volu348%';`
* `$ FLUSH PRIVILEGES;`
* `$ RAILS_ENV=production rake db:create --trace && RAILS_ENV=production rake db:migrate --trace`
* `$ sudo nano /etc/network/interfaces`
  * Remplir avec ceci :
* `$ sudo apt-get install chkconfig -y`
* `$ sudo chkconfig nginx on`
* `$ sudo nano /etc/lightdm/lightdm.conf` <= Line 117 et 118 : ticket et 0
* `$ couper wicd au démarrage -> préférences ->app par défaut LXSession -> Autostart -> Decocher Wicd Network Manager Tray`
* `$ sudo apt-get install xrdp -y`
* `$ sudo apt-get install mysql-workbench -y`
* `$ sudo nano /etc/apt/sources.list`
  * Ajouter : "deb http://ftp.fr.debian.org/debian sid main"
* `$ sudo apt-get update`
* `$ sudo apt-get install sbackup`
* `$ sudo nano /etc/apt/sources.list`
  * Supprimer : "deb http://ftp.fr.debian.org/debian sid main"
* `$ sudo apt-get update`
* `$ wheneverize`
* `$ whenever --update-cron`
