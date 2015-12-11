package Local::Iterator;

use strict;
use warnings;
use DDP;

sub new {
	my ($class, %params) = @_;	
	my $obj = bless \%params, $class;
	$obj->init();
	return $obj;
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
