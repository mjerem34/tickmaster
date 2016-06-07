#!/bin/bash
# Lancer en root

# Test montage des partitions
if cd /media/Systemback/mysql; then
	echo "Tout est ok !"
else
	echo "Les partitions ne sont pas montées, tentative de montage"
	if mount -a; then
		echo "Remontage des partitions ok"
	else
		echo "Erreur lors du montage des partitions"
		if /bin/bash -l -c 'printf "Subject: Erreur lors du remontage des partitions" | msmtp jeremy.montesinos@cle-expertises.fr'; then
			 echo "Email envoyé"
		else
                         echo "Envoi de l'email impossible, bonne chance pour la suite !"
                fi
	fi
fi

# Test si le serveur puma rails est lancé
if [ !  -e "/home/ticket/Bureau/TickMasterV2/public/sockets/puma.sock" ]; then
	echo "Puma n'est pas lancé, tentative de démarrage"
	su ticket <<'EOF'
		if cd /home/ticket/Bureau/TickMasterV2/; then
		        echo "cd ok"
		else
		        echo "cd nok"
			if /bin/bash -l -c 'printf "Subject: Erreur lors de la tentative de change directory pour demarrer puma rails dans checks.sh" | msmtp jeremy.montesinos@cle-expertises.fr'; then
                                echo "Email envoyé"
                        else
                                echo "Envoi de l'email impossible, bonne chance pour la suite !"
                        fi
		fi
		if /bin/bash -l -c 'puma -e production -d'; then
        		echo "Puma démarré"
		else
        		echo "can't start puma"
			if /bin/bash -l -c 'printf "Subject: Puma ne peux pas démarrer ..." | msmtp jeremy.montesinos@cle-expertises.fr'; then
				echo "Email envoyé"
			else
				echo "Envoi de l'email impossible, bonne chance pour la suite !"
			fi
		fi
EOF
else
	echo "Socket Puma existe, Puma est lancé, ok!"
fi

# Test si le serveur nginx est démarré
if ps ax | grep -v grep | grep nginx > /dev/null; then
    echo "nginx lancé, tout est ok !"
else
    echo "nginx n'est pas lancé, tentative de redémarrage"
	if /etc/init.d/nginx start; then
                echo "Serveur nginx redémarré"
        else
		echo "Impossible de redémarrer nginx"
                if /bin/bash -l -c 'printf "Subject: Nginx ne peux pas démarrer ..." | msmtp jeremy.montesinos@cle-expertises.fr'; then
                        echo "Email envoyé"
                else
                        echo "Envoi de l'email impossible, bonne chance pour la suite !"
                fi
        fi
fi

# Test si le serveur mysql est démarré
if ps ax | grep -v grep | grep mysql > /dev/null; then
    echo "mysqld lancé, tout est ok !"
else
    echo "mysqld n'est pas lancé, tentative de redémarrage"
	if /etc/init.d/mysql start; then
		echo "Serveur mysql redémarré"
	else
		echo "Impossible de redémarrer mysql"
		if /bin/bash -l -c 'printf "Subject: Mysql ne peux pas démarrer ..." | msmtp jeremy.montesinos@cle-expertises.fr'; then
			echo "Email envoyé"
	        else
	                echo "Envoi de l'email impossible, bonne chance pour la suite !"
	        fi
	fi
fi
exit 0
