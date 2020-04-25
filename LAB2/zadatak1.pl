#!/bin/perl

print "Unesite niz znakova\n";
chomp(@arguments = <>);
	
print "Unesite broj ponavljanja znakova\n";
chomp($num_of_repetitions = <>);

$count = 0;
while ($count < $num_of_repetitions) {
	print "@arguments\n";
	$count += 1;
}


