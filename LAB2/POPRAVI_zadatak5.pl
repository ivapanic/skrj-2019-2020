#!/bin/perl

if (scalar @ARGV != 1) {
	die "Enter the name of the file\n";
}

$file = pop @ARGV;

if (! open FILE, $file) {
	die "The file cannot be found\n";
}


$first_line = 1;
@coeffs = ();
@students = ();
@sorted_students = ();

sub output {
	print "Lista po rangu:\n";
	print "-----------------------\n";

	for (0...scalar @sorted_students) {
		($score, $prezime, $ime, $jmbag) = split(/;/, $sorted[$_]);
		printf "%3d. %-50s : %-.2f\n", $_ + 1, "$prezime, $ime ($jmbag)" , $score;
	}
}


sub get_score {
	$score = 0;
	@components = split /;/, $komponente;
	
	for (0...scalar @coeffs) {
		$score += $components[$_] * $coeffs[$_];
	}
	$komponente = $score;
}

while(<>) {
	chomp;
	if ($first_line == 1) {
		@coeffs = split /;/, $_;
		$first_line = 0;
	}
	
	$_ =~ s/-/0/;
	($jmbag, $prezime, $ime, $komponente) = split /;/, $_, 4;
	get_score;
}

@sorted_students = sort {$b <=> $a} @students;
	

	
	
	
