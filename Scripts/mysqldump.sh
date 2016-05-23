#!/bin/bash


cd /media/Systemback/mysql/sauvegardeBDD/

for i in Tickets_production; do

## Sauvegarde des bases de donnees en fichiers .sql
mysqldump -uticket -pVolu348% $i > ${i}_`date +"%Y-%m-%d"`.sql

## Compression des exports en tar.bz2 (le meilleur taux de compression)
tar jcf ${i}_`date +"%Y-%m-%d"`.sql.tar.bz2 ${i}_`date +"%Y-%m-%d"`.sql

## Suppression des exports non compresses
rm ${i}_`date +"%Y-%m-%d"`.sql

done
