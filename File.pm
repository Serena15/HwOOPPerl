package Local::Iterator::File;
use strict;
use warnings;
use base 'Local::Iterator';

sub init {
	my ($self) = @_;
	if(defined  $self->{filename}) {
		open(my $fh, '<',  $self->{filename});
		 $self->{fh} = $fh;
	}
}

sub next {
	my ($self) = @_;
	my $fh = $self->{fh};
	my $row = <$fh>;			
	unless(defined $row) {
		return (undef, 1);	
	}	
	chomp $row;	
	return ($row, 0);
}

sub DESTROY {
	my ($self) = @_;
	close($self->{fh}) if $self->{fh};
}

1;
