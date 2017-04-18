#!/bin/bash


if [ $(id -u) != "0" ]; then
  echo "You must be the superuser to run this script" >&2
  exit 1
fi
chmn="/home/ticket/Bureau/";
nm="tickmaster";
now="`date +%Y%m%d%H%M%S`";

echo 'Exctinction nginx'
sudo service nginx stop
echo 'Demontage des partages réseaux pour uploads'
sudo umount $chmn$nm/public/uploads
echo 'Deplacement du dossier de lapp pour faire un backup'
sudo mv $chmn$nm $chmn$nm$now
echo 'Passage en su ticket'
cd $chmn
su ticket <<'EOF'
echo 'Changement de répertoire vers $chmn'
echo 'Clonage git'
git clone https://mjerem34@framagit.org/mjerem34/tickmaster.git
echo 'mkdir dossier uploads'
mkdir tickmaster/public/uploads
echo 'mkdir dossier sockets'
mkdir tickmaster/public/sockets
EOF
echo 'remontage des partages'
sudo mount -a
echo 'redemarrage nginx'
sudo service nginx start
echo 'passage a su ticket'
echo 'deplacement vers dossier tickmaster'
cd $chmn$nm
echo 'Vous avez juste a lancer la commande suivante en tant qu`utilisateur ticket :'
echo 'cd /home/ticket/Bureau/tickmaster/ && puma -e production -d'

exit 0
