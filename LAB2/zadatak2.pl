#!/bin/perl -w

sub arithmetic_mean {
	$length = scalar @numbers;
	$total = 0;
	$mean = 0;

	foreach $element (@numbers) {
		$total += $element;
	}
	
	$mean = $total / $length;
	print "Arithmetic mean of numbers @numbers is $mean.\n";
} 


@numbers = ();
print "Enter numbers to find out arithmetic mean.\n";

while (<>) {
	chomp($_);
	push @numbers, $_;
}

arithmetic_mean;
