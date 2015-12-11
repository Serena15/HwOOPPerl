package Local::Iterator::File;
use strict;
use warnings;

sub new {
	my ($class, %params) = @_;
	if(defined $params{filename}) {
		open(my $fh, '<', $params{filename});
		$params{fh} = $fh;
	}
	return bless \%params, $class;
}

sub next {
	my ($self) = @_;
	my $fh = $self->{fh};
	my $row = <$fh>;			
	unless(defined $row) {
		close($fh);
		return (undef, 1);	
	}	
	chomp $row;	
	return ($row, 0);
}

sub all {
	my ($self) = @_;	
	my @array = ();
	my $fh = $self->{fh};
	while(<$fh>) {
		chomp;
		push @array, $_;	
	}
	return \@array;
}

1;
