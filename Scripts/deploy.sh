#!/bin/bash


if [ $(id -u) != "0" ]; then
  echo "$(date) - You must be the superuser to run this script" >&2
  exit 1
fi
chmn="/home/ticket/Bureau/";
nm="TickMasterV2";
now="-`date +%Y%m%d%H%M%S`";

if sudo service nginx stop; then
        echo '$(date) - Exctinction nginx'
else
        echo "$(date) - Impossible d'eteindre nginx"
fi

echo '$(date) - Demontage des partages réseaux pour uploads'
if sudo umount $chmn$nm/public/uploads; then
        echo "$(date) - ok"
else
        echo "$(date) - echec"
fi

echo '$(date) - Deplacement du dossier de lapp pour faire un backup'
if sudo mv $chmn$nm $chmn$nm$now; then
        echo "$(date) - ok"
else
        echo "$(date) - echec"
fi

echo '$(date) - Passage en su ticket'
cd $chmn

su ticket <<'EOF'
echo '$(date) - Changement de répertoire vers $chmn'
echo '$(date) - Clonage git'
if git clone https://expertises:clesateb@framagit.org/EXPERTISES/TickMasterV2.git; then
        echo "$(date) - ok"
else
        echo "$(date) - echec"
        exit 1
fi

echo '$(date) - mkdir dossier uploads'
if mkdir /home/ticket/Bureau/TickMasterV2/public/uploads; then
        echo "$(date) - ok"
else
        echo "$(date) - echec"
        exit 1
fi

echo '$(date) - mkdir dossier sockets'
if mkdir /home/ticket/Bureau/TickMasterV2/public/sockets; then
        echo "$(date) - ok"
else
        echo "$(date) - echec"
        exit 1
fi
EOF
echo '$(date) - remontage des partages'
if sudo mount -a; then
        echo "$(date) - ok"
else
        echo "$(date) - echec"
        exit 1
fi

echo '$(date) - redemarrage nginx'
if sudo service nginx start; then
        echo "$(date) - ok"
else
        echo "$(date) - echec"
        exit 1
fi

echo '$(date) - deplacement vers dossier TickMasterV2'
if cd $chmn$nm; then
	echo "ok"
else
	echo 'nok'
fi
su ticket <<'EOF'

if /bin/bash -l -c 'rake db:migrate RAILS_ENV=production'; then
  echo "$(date) - Raked !"
else
  echo "$(date) - Can't do Rake ! Cruel World !!!!"
fi

if /bin/bash -l -c 'rvmsudo puma -e production -d'; then
        echo "$(date) - puma started"
else
        echo "$(date) - can't start puma"
fi

EOF

exit 0
