#!/bin/bash


if [ $(id -u) != "0" ]; then
  echo "You must be the superuser to run this script" >&2
  exit 1
fi
chmn="/home/ticket/Bureau/";
nm="TickMasterV2";
now="-`date +%Y%m%d%H%M%S`";

if sudo service nginx stop; then
        echo 'Exctinction nginx'
else
        echo "Impossible d'eteindre nginx"
fi

echo 'Demontage des partages réseaux pour uploads'
if sudo umount $chmn$nm/public/uploads; then
        echo "ok"
else
        echo "echec"
fi

echo 'Deplacement du dossier de lapp pour faire un backup'
if sudo mv $chmn$nm $chmn$nm$now; then
        echo "ok"
else
        echo "echec"
fi

echo 'Passage en su ticket'
cd $chmn

su ticket <<'EOF'
echo 'Changement de répertoire vers $chmn'
echo 'Clonage git'
if git clone https://mjerem34:akssm922@framagit.org/mjerem34/TickMasterV2.git; then
        echo "ok"
else
        echo "echec"
        exit 1
fi

echo 'mkdir dossier uploads'
if mkdir TickMasterV2/public/uploads; then
        echo "ok"
else
        echo "echec"
        exit 1
fi

echo 'mkdir dossier sockets'
if mkdir TickMasterV2/public/sockets; then
        echo "ok"
else
        echo "echec"
        exit 1
fi
EOF
echo 'remontage des partages'
if sudo mount -a; then
        echo "ok"
else
        echo "echec"
        exit 1
fi

echo 'redemarrage nginx'
if sudo service nginx start; then
        echo "ok"
else
        echo "echec"
        exit 1
fi

echo 'deplacement vers dossier TickMasterV2'
cd $chmn$nm
su ticket <<'EOF'

if cd /home/ticket/Bureau/TickMasterV2/; then
        echo "cd ok"
else
        echo "can't do cd"
fi

if /bin/bash -l -c 'rake db:migrate RAILS_ENV=production'; then
  echo "Raked !"
else
  echo "Can't do Rake ! Cruel World !!!!"
fi

if /bin/bash -l -c 'puma -e production -d'; then
        echo "puma started"
else
        echo "can't start puma"
fi

EOF

exit 0
