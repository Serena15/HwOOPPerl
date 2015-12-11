use strict;
use warnings;
use DDP;

sub next {
	my ($self) = shift;
	my @group = ();
	my ($data, $end) = (0,0);
	for my $arg (1..$self->{chunk_length}) {
		($data, $end) = $self->{iterator}->next();
		if ($end) {
			if($arg != 1) {
				$end = 0;
			}
			last;
		}
		push @group, $data;		
	}
	if ($end) {
		return (undef, 1);
	}		
	return (\@group, $end);
}

1;
