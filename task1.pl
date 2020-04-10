#!/usr/bin/perl


use List::Util qw( min max );
# test 1162
solution(1162);

sub solution { 
    my ($N) =@_;

	my $decimal=$N;
	my @res=();
	my $ng=0;


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
	
	#	print "lit=($lit) $bits[$c]\n";
		if($lit == 0)
		{
			#print "Found ZERO at pos $c in array $bits[$c]\n";
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
        	# Check ther is a gap
        	my $c = $p;

        	if($bits[$p] == 0) # Ok to carry on and count
        	{
                	my $size = @bits;
                	$size = ($size - 1);
                	print "size=size of array >$size< p=>$p<\n";
                	if(check_for_gap($p,$size) == 0)
                	{
                        	print "NoGap\n!";#	
			
                        	$ng=1;
                	}
                	return 0;

        	}else
        	{
                	return 1;
        	}

}
sub check_for_gap {
        my $gap_pointer = shift;
        my $limit = shift;
        my $trip_wire=1;

	print "\n DEBUG in check_for_gap, gap_pointer=>$gap_pointer<\tlimit=>$limit<\n";

	if($gap_pointer > $limit)
	{
		print "No gap!\n";
		return 0;
	}	

        for my $i ($gap_pointer..$limit)
        {
                if($bits[$i] == 0)
                {
                        $trip_wire=0;
                }
                else
                {
                        $trip_wire++;
                }
        }
        if($trip_wire == 0)
        {
                return 0;
        }
        else
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
        return 0;
}
my $max = max @zc;
if($ng == 1 && $size == 0)
{
	print "\nZERO 0\n";
	
        return 0;
}else
{
	if($ng == 1)
	{
		#reset last value
                $size = ($size - 1);
		$zc[$size] = 0;
		print "DEBUG \n size=>$size< Z=$zc[$size]\n";
		$max = max @zc;
		print "\n\t$max\n\n";
		return $max;

	}else
	{
		print "\n\tng = 0$max\n\n";
		return $max;
	}

}

}
