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
    * ```
      upstream app{
        server unix:/home/ticket/Bureau/TickMasterV2/public/sockets/puma.sock fail_timeout=0;
      }
      server{
        listen 80;
        server_name 10.0.171.250;
        root /home/ticket/Bureau/TickMasterV2/public/;
        #passenger_enabled on;
        #passenger_app_env production;
        try_files $uri/index.html $uri @app;

        location @app {
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header Host $host;
          proxy_redirect off;
          proxy_pass http://app;
        }

        error_page 500 502 503 504 /500.html;
        keepalive_timeout 10;
        location = /favicon.ico {
          expires         max;
          add_header      Cache-Control public;
        }
      }

      ```
* `$ sudo ln -s /etc/nginx/sites-available/ticket /etc/nginx/sites-enabled/ticket -f`
* `$ sudo nano /etc/nginx/nginx.conf`
  * Remplir avec ceci :
    * ```
      user www-data;
      worker_processes 4;
      pid /run/nginx.pid;

      events {
        worker_connections 768;
        # multi_accept on;
      }
      http {
        ##
        # Basic Settings
        ##
        sendfile on;
        tcp_nopush on;
        tcp_nodelay on;
        keepalive_timeout 65;
        types_hash_max_size 2048;      
        client_max_body_size 100M;
        # server_tokens off;

        # server_names_hash_bucket_size 64;
        # server_name_in_redirect off;

        include /etc/nginx/mime.types;
        default_type application/octet-stream;

        ##
        # SSL Settings
        ##

        ssl_protocols TLSv1 TLSv1.1 TLSv1.2; # Dropping SSLv3, ref: POODLE
        ssl_prefer_server_ciphers on;

        ##
        # Logging Settings
        ##

        access_log /var/log/nginx/access.log;
        error_log /var/log/nginx/error.log;

        ##
        # Gzip Settings
        ##

        gzip on;
        gzip_disable "msie6";

        # gzip_vary on;
        # gzip_proxied any;
        # gzip_comp_level 6;
        # gzip_buffers 16 8k;
        # gzip_http_version 1.1;
        # gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;

        ##
        # Virtual Host Configs
        ##

        include /etc/nginx/conf.d/*.conf;
        include /etc/nginx/sites-enabled/*;
      }

      ```
* `$ sudo service nginx restart`
* `$ sudo nano /etc/mysql/my.cnf` #comment out bind_addressline
* `$ sudo service mysql restart`
* `$ mysql -u root -p`
* `$ GRANT ALL PRIVILEGES ON Tickets_production.* TO ticket IDENTIFIED BY 'Volu348%';`
* `$ FLUSH PRIVILEGES;`
* `$ RAILS_ENV=production rake db:create --trace && RAILS_ENV=production rake db:migrate --trace`
* `$ sudo nano /etc/network/interfaces`
  * Remplir avec ceci :
    * ```
      # This file describes the network interfaces available on your system
      # and how to activate them. For more information, see interfaces(5).

      source /etc/network/interfaces.d/*

      # The loopback network interface
      auto lo
      iface lo inet loopback

      # The primary network interface
      auto eth0
      iface eth0 inet static
        address 10.134.2.250
        netmask 255.255.255.0
        gateway 10.134.2.254
        broadcast 10.134.2.255
        dns-nameservers 10.30.0.1

      ```
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
