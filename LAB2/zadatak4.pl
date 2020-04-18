#!/bin/perl


sub parse {
	@parts = split /;/, $_;
	$jmbag = shift @parts;
	$prezime = shift @parts;
	$ime = shift @parts;
	
	$termin = shift @parts;
	@temp = split / /, $termin;
	$termin_datum = $temp[0];
	$termin_sati = $temp[1];
	
	$zakljucano = shift @parts;
	@temp = split / /, $zakljucano;
	$zakljucano_datum = $temp[0];
	$zakljucano_sati = $temp[1];

	@temp = split /-/, $termin_datum;
	$termin_dan = $temp[2];
	@temp = split /-/, $zakljucano_datum;
	$zakljucano_dan = $temp[2];

	@termin_vrijeme = split /:/, $termin_sati;
	@zakljucano_vrijeme = split /:/, $zakljucano_sati;
		
}

sub remove_leading_zeros {
	@temp = split //, $termin_vrijeme[0];
	if ($temp[0] == 0) {
		$termin_vrijeme[0] = $temp[1];
	}
	@temp = split //, $termin_vrijeme[1];
	if ($temp[0] == 0) {
		$termin_vrijeme[1] = $temp[1];
	}
	@temp = split //, $zakljucano_vrijeme[0];
	if ($temp[0] == 0) {
		$zakljucano_vrijeme[0] = $temp[1];
	}
	@temp = split //, $zakljucano_vrijeme[1];
	if ($temp[0] == 0) {
		$zakljucano_vrijeme[1] = $temp[1];
	}

}


sub output {
	remove_leading_zeros;

	if (($zakljucano_dan - $termin_dan != 0)) {		
	print "$jmbag $prezime $ime - PROBLEM: $termin_datum $termin_sati --> $zakljucano_datum $zakljucano_sati \n";
	}
	if ($zakljucano_vrijeme[0] - $termin_vrijeme[0] > 1) {		
	print "$jmbag $prezime $ime - PROBLEM: $termin_datum $termin_sati --> $zakljucano_datum $zakljucano_sati \n";
	};
	if ($zakljucano_vrijeme[0] - $termin_vrijeme[0] == 1 && $zakljucano_vrijeme[1] - $termin_vrijeme[1] > 0) {
		print "$jmbag $prezime $ime - PROBLEM: $termin_datum $termin_sati --> $zakljucano_datum $zakljucano_sati \n";
	}

}

while (<>) {
	chomp;
	parse;
	output;
}
	
