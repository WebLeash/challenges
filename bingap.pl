#!/usr/bin/perl
use strict;
use warnings;
use List::Util qw( min max );

my $decimal;
my @res=();


print "Enter a number to convert: ";
chomp($decimal = <STDIN>);
print "\nConverting $decimal to binary...\n";

my $bin_val =sprintf "%b\n", $decimal;
chomp $bin_val;;

## Use split to get the arrayof binar bits
my @bits = split(//, $bin_val);


print "Converted $decimal to binary value >$bin_val<\n";

#recursion
my $c=0;
my @zc=(); # array holding results
my $zp=0; # pointer
foreach my $lit(@bits)
{
	
	print "lit=($lit) $bits[$c]\n";
	if($lit == 0)
	{
		print "Found ZERO at pos $c in array $bits[$c]\n";
	       	if(check_next($c) == 0)
		{
	        	$zc[$zp]+= 1;
		}
		else
		{
	        	$zc[$zp]+= 1;
			$zp++;
		}

	}
	$c++;
}
sub check_next {
	my $p = shift;
	$p++;
	print "debug in check_next = >$bits[$p]<\n";
        # Is next pos a zero?
	if($bits[$p] == 0) # Ok to carry on and count
	{
		return 0;
	}else
	{
		return 1;
	}

}
foreach my $pos(@zc)
{
	print "zc>$pos< \n";
}
my $size = @zc;
if($size == 0)
{
	print "no zeros";
	exit 0;
}
my $max = max @zc;
print "largest number of zeros = >$max<\n";
