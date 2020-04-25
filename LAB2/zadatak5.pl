#!/usr/bin/perl -w

#use open ':locale';
use locale;


if (scalar @ARGV != 1) {
	die "Enter the name of the file\n";
}

$file = pop @ARGV;


if (! open FILE, $file) {
	die "The file cannot be found\n";
}

sub sorted_output {
	$range = 1;
	print "Lista po rangu:\n";
	print "---------------------\n";

	foreach $jmbag (sort {$rang{$b} <=> $rang{$a}} keys %rang) {
        	print "   $range. $jmbag   :   ";
		printf "%-.2f\n",  $rang{$jmbag};
        	$range++;
	}
}

$i = 0;

while(<FILE>){
	
	if ($i == 1) {
		@factors = split /;/, $_;
	}

	if ($i >= 4) {
		@elements = split /;/, $_;
		$jmbag = shift @elements;
		$surname = shift @elements;
		$name = shift @elements;
		
		$grades_sum = 0;
		$index = 0;
		do {
			$is_none = $elements[$index] eq '-';
			if (! $is_none) {
				$grades_sum += $elements[$index] * $factors[$index];
			}
			$index++;
		} while ($index <= 6);

		$key = " $surname, $name ($jmbag)";
        	$rang{$key} = $grades_sum;

	}

	$i++;
		
}

sorted_output;
