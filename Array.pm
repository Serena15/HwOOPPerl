package Local::Iterator::Array;
use base Local::Iterator;
use strict;
use warnings;

sub next {
	my ($self) = shift;
	if ($self->{count} >= scalar @{$self->{array}}) {	
		return (undef, 1);
	}
	my $data = ${$self->{array}}[$self->{count}];
	$self->{count}++;
	return ($data, 0);
}

1;
