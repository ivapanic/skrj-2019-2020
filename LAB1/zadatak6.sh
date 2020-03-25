#!/bin/bash


if test '$#' -ne 2 
then
	echo "Unesite datoteke i direktorij za backup"
	exit 1
fi

backup_direktorij=${!#}

if [[ ! -d $backup_direktorij ]]
then
	echo "Direktorij ne postoji. Stvaranje direktorija..."
	mkdir $backup_direktorij
else
	echo "Direktorij vec postoji."

fi
	

kopirane_datoteke=0
for element in "$@"
do
	if [[ $element != $backup_direktorij ]]
	then 
		if [[ ! -f $element || ! -r $element ]]; then
			echo "Datoteka ne postoji ili se ne moze procitati"
		else
			cp $element $backup_direktorij
			kopirane_datoteke=$((kopirane_datoteke + 1))
		fi
	fi
done

echo "Ukupno kopiranih datoteka: $kopirane_datoteke"		
	
	
	
	




