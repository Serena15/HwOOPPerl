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

package Local::Iterator::File;

use strict;
use warnings;
use DDP;

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
	#print "------\n";
	my $row = <$fh>;
	#print "------\n";	
	#p $row;
	#print "------\n";			
	unless(defined $row) {
		#close($fh);
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

sub DESTROY {
	my ($self) = @_;
	close($self->{fh}) if $self->{fh};
}

1;
