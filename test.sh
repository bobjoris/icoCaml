#!/bin/sh

dossier=$1
fichiers="./$dossier/*.p"
exp="$dossier/export/"
rm -r $exp
mkdir $exp

for file in `find $fichiers -type f -maxdepth 1 \( ! -iname ".*" \) | sed 's#.*/##'`
do
	./pseudopascal ./$dossier/$file
	dot -Tpng ./$dossier/$file.dot -o ./$exp/$file.png
	rm ./$dossier/$file.dot
done