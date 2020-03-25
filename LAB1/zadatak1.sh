#!/bin/bash
proba="Ovo je proba"
echo $proba
lista_datoteka=$(ls [[:alpha:]]*[[:digit:]]*)
echo $lista_datoteka
echo "----------------------------"
proba3="$proba. $proba. $proba". 
echo $proba3
echo "----------------------------"
a=4
b=3
c=7
d=$(((a+4)*b%c))
echo $d
echo "----------------------------"
broj_rijeci=$(wc -w $(find *.*) | tail -1 | awk '{print $1;}')
echo $broj_rijeci
echo "----------------------------"
ls -a ~iva
echo "----------------------------"
sudo cut -d ":" -f 1,6,7 /etc/passwd
echo "----------------------------"
ps -u | tr -s " " | cut -d " " -f 1,2,11


