#!/bin/bash
echo $1
echo $2

if [ $# -ne 2 ] ; then
	echo "Unesite kazalo i zeljeni oblik imena"
else 
	ime_direktorija=$1
	ime_datoteka=$2
	cd $ime_direktorija
	find . -name "$ime_datoteka" | xargs wc -l
fi


