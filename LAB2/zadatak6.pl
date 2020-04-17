use open ':locale';
use locale;

if (scalar @ARGV != 2) {
	die "Enter two arguments (name of the file and length of the prefix)\n";
}

$length = pop @ARGV;
$file = pop @ARGV;


my $success = open FILE, "$file";
if (! $success) {
	die "The file $file cannot be opened or doesn't exist.\n";
}

@wordcount = ();

while (<FILE>) {
	chomp;
	$_ = lc($_);
	@prefixes = m/\b(\w{$length})/g;

	foreach $element (@prefixes) {
		$wordcount{$element} += 1;
	}
}



@element = keys %wordcount;
@element = sort @element;

foreach (@element) {
	print "$_ : $wordcount{$_}\n";
}


