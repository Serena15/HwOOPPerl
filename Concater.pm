package Local::Iterator::Concater;
use strict;
use warnings;
use base 'Local::Iterator';

sub init {
	my ($self) = @_;
	$self->{count} = 0;
} 

sub next {
	my ($self) = shift;
	if ($self->{count} >= scalar @{$self->{iterators}}) {	
		return (undef, 1);
	}
	my ($data, $end) = ${$self->{iterators}}[$self->{count}]->next();
	if ($end) {
		$self->{count}++;
		if ($self->{count} < scalar @{$self->{iterators}}) {
			($data, $end) = ${$self->{iterators}}[$self->{count}]->next();
			if($end) {
				$self->{count}++;
				$self->next();
			}
		}
		else {
			return (undef, 1);
		}
	}
	return ($data, $end);
}

1;
