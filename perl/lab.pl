#!/usr/bin/env perl
use strict;
use warnings;

my $scalar = [1,3,4];
my @array = (1,2,3);
my %hash = ('1'=>'one','2'=>'two','3'=>'three');
my $aref = \@array;
print "\n";
print $_ foreach (%hash);
print "\n";
#my $href = \%hash;
#my $sref = \$scalar;
print $_,"ref\n" foreach (@{$scalar});
print @array;
print %hash;
print "\n---------\n";
foreach my $key (keys %hash) {
    print $key+1,"\n";
}
print "\n==========\n";
