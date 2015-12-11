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
	chomp $row;		
	my $data = $row;
	my $flag = 0;
	unless(defined $data) {
			$flag = 1;
	}	
	close($fh) if eof($fh);
	return ($data, $flag);
}

sub all {
	my ($self) = @_;	
	my @array = ();
	my $fh = $self->{fh};
	while(<$fh>) {
		chomp;
		push @array, $_;	
	}
	close($fh);
	return \@array;
}

1;
