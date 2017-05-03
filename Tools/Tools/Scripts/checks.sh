#!/bin/bash
# Test montage des partitions
if cd /media/Systemback/mysql; then
	echo "$(date) - Tout est ok !"
else
	echo "$(date) - Les partitions ne sont pas montées, tentative de montage"
	if mount -a; then
		echo "$(date) - Remontage des partitions ok"
	else
		echo "$(date) - Erreur lors du montage des partitions"
		if /bin/bash -l -c 'printf "Subject: $(date) - Erreur lors du remontage des partitions" | msmtp jeremy.montesinos@cle-expertises.fr'; then
			 echo "$(date) - Email envoyé"
		else
                         echo "$(date) - Envoi de l'email impossible, bonne chance pour la suite !"
                fi
	fi
fi

# Test si le serveur puma rails est lancé
pidof ruby >/dev/null
if [[ $? -ne 0 ]]; then
	echo "$(date) - Puma n'est pas lancé, tentative de démarrage"
		if cd /home/ticket/Bureau/TickMasterV2/; then
		        echo "$(date) - cd ok"
		else
		        echo "$(date) - cd nok"
			if /bin/bash -l -c 'printf "Subject: $(date) - Erreur lors de la tentative de change directory pour demarrer puma rails dans checks.sh" | msmtp jeremy.montesinos@cle-expertises.fr'; then
                                echo "$(date) - Email envoyé"
                        else
                                echo "$(date) - Envoi de l'email impossible, bonne chance pour la suite !"
                        fi
		fi
 su ticket << 'EOF'
export rvmsudo_secure_path=1

		if /bin/bash -l -c "/home/ticket/.rvm/bin/rvmsudo puma -e production -d"; then
        		echo "$(date) - Puma démarré"
		else
        		echo "$(date) - can't start puma"
			if /bin/bash -l -c 'printf "Subject: $(date) - Puma ne peux pas démarrer ..." | msmtp jeremy.montesinos@cle-expertises.fr'; then
				echo "$(date) - Email envoyé"
			else
				echo "$(date) - Envoi de l'email impossible, bonne chance pour la suite !"
			fi
		fi
EOF
else
	echo "$(date) - Socket Puma existe, Puma est lancé, ok!"
fi

# Test si le serveur nginx est démarré
if ps ax | grep -v grep | grep nginx > /dev/null; then
    echo "$(date) - nginx lancé, tout est ok !"
else
    echo "$(date) - nginx n'est pas lancé, tentative de redémarrage"
	if sudo service nginx restart; then
                echo "Serveur nginx redémarré"
        else
		echo "$(date) - Impossible de redémarrer nginx"
                if /bin/bash -l -c 'printf "Subject: $(date) - Nginx ne peux pas démarrer ..." | msmtp jeremy.montesinos@cle-expertises.fr'; then
                        echo "$(date) - Email envoyé"
                else
                        echo "$(date) - Envoi de l'email impossible, bonne chance pour la suite !"
                fi
        fi
fi

# Test si le serveur mysql est démarré
if ps ax | grep -v grep | grep mysql > /dev/null; then
    echo "$(date) - mysqld lancé, tout est ok !"
else
    echo "$(date) - mysqld n'est pas lancé, tentative de redémarrage"
	if sudo service mysql restart; then
		echo "$(date) - Serveur mysql redémarré"
	else
		echo "$(date) - Impossible de redémarrer mysql"
		if /bin/bash -l -c 'printf "Subject: $(date) - Mysql ne peux pas démarrer ..." | msmtp jeremy.montesinos@cle-expertises.fr'; then
			echo "$(date) - Email envoyé"
	        else
	                echo "$(date) - Envoi de l'email impossible, bonne chance pour la suite !"
	        fi
	fi
fi
exit 0
