#!/bin/bash

echo $1
echo $2

broj_argumenata=$#
if [ $broj_argumenata -ne 2 ] ; then
	echo "Unesite izvorno kazalo i odredisno kazalo"
fi

izvor=$1
po_mjesecima=$2

if [ -d $po_mjesecima ] ; then
	echo "Direktorij $po_mjesecima postoji"
else
	mkdir $po_mjesecima
fi


cd $izvor
for file in $(ls *.jpg); do
	datum=$(date -r $file "+%Y-%m")

	if [ -d /$po_mjesecima/$datum ] ; then
		echo "Direktorij $datum postoji. Premjestanje $file..."
		mv $file $po_mjesecima/$datum
	else
		mkdir $po_mjesecima/$datum
		mv $file $po_mjesecima/$datum
	fi
done

