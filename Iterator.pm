package Local::Iterator;

use strict;
use warnings;
use DDP;

sub new {
	my ($class, %params) = @_;	
	$params{count} = 0;
	return bless \%params, $class;
}

sub all {
	my ($class) = @_;	
	my @array = ();
	my ($next, $end) = $class->next();
	while (!$end) {
		push @array, $next;
		($next, $end) = $class->next();
	}
	return \@array;
}

our $VERSION = '1.00';

1;
