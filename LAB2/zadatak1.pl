#!/bin/perl


if (scalar @ARGV lt 2) {
	die "Invalid number of arguments - must be 2 or more\n";
}
	
else {
	@arguments = @ARGV;
	$num_of_repetitions = pop @arguments;
	
	$count = 0;
	while ($count < $num_of_repetitions) {
		print "@arguments\n";
		$count += 1;
	}
}

