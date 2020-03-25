#!/bin/bash
grep -ie banana -e jabuka -e dinja -e lubenica namirinice.txt 
echo "-------------------------"
grep -vie banana -e jabuka -e dinja -e lubenica namirinice.txt > ne-voce.txt
grep -rlnE "$[A-Z]{3}[0-9]{6}$" ~/projekti/
echo "-------------------------"
find . -type f -mtime -14 -mtime +7 | ls -al
echo "-------------------------"
for i in $(seq 15); do echo $i; done

