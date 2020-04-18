#!bin/perl


if (scalar @ARGV != 2) {
	print "Read script from input\n";
}


@date_and_time = (); 
$date_flag = 1;

sub parse {
	chomp;
	@split1 = split /\[/;
	@split2 = split /\]/, $split1[1];
	@split3 = split /:/, $split2[0];
	$date = $split3[0];
	$time = $split3[1];
	$date_and_time[0] = $date;
	$date_and_time[1] = $time;
	
}


sub details { 
	print " Datum: $date\n";
	print " sat : broj pristupa\n";
	print "-------------------------------------\n";
}

	

sub end_of_file {
	foreach (keys @count) {
		print "   $_ : $count[$_]\n";
		$count[$_] = 0;
	}
}




while(<>) {

	parse;
	$date = $date_and_time[0];
	$time = $date_and_time[1];

	if ($date_flag == 1) {
		details;
		$date_flag = 0;
	}

	if ($date_flag == 0) {
		$count[$time]++;
	}

	
	if (eof) {
		$date_flag = 1;
		end_of_file;
		print "\n";

	}
		
}	
	
	
