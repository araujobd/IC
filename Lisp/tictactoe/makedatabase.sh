#!/bin/bash

###########################
######  BRUNO DANTAS ######
###########################

database="database.lisp"
rules="rules.txt"

if [ -f $database ]
then
  rm $database
fi

touch $database

echo "(defvar database)" >> $database
echo "(setq database '(" >> $database

sed 's/\([amv]\)\([0-8]\)/(\1 \2)/g' $rules | sed 's/^/  /g' >> $database
#sed -i 's/\([v]\)\([0-8]\)/(\1 \2)/g' $database

echo "))" >> $database

echo "OK"
