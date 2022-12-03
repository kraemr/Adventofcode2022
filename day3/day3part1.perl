use strict;
use warnings;


my $file = 'input.txt';
open(INFO,$file);
my @lines = <INFO>;
close(INFO);
#print @lines;
#my $lower = 'z';
#print ord($lower)- 96;
#my $higher = 'Z';
#print '  ';
#print ord($higher) - 38;
# if ascii value is bigger than 96 then charvalue - 96 is value
# if ascii value is < than 96 then char value - 38 is value

sub findoccurences
{
	#this is the char to look for 
	my $chr = $_[0]; 
	#input str
	my $str = $_[1];
	my $count = () = $str =~ /\Q$chr/g;
	return $count;
}

#get the priorities of the different item types
sub getprio
{
	my $ch = $_[0];
	my $ret = 0;
	
	if( ord($ch) >= 96 ){
		$ret = ord($ch)-96;
				
	}
	else{ 
		$ret = ord($ch)-38;
	} 
	return $ret;
}

# find commanalities between strings
sub findcommon
{
	my $fst_compartment = $_[0];
	my $snd_compartment = $_[1];
	#print $fst_compartment;
	#print '  ';
	#print $snd_compartment;
	my $char = '';	
	my $prio_sum = 0;
	my @usedchars;
	foreach $char (split //, $fst_compartment)
	{
	  if(findoccurences($char,$snd_compartment) > 0){
		#contains the specified char
		#print "both contain $char \n";
	   	$prio_sum = getprio($char);
#		push(@usedchars,$char);
		last;
	  }	
	  else {
	  	# does not contain the char
	  }
	}



	
	return $prio_sum;
}


#loop through the input file line by line 
my $prio_result = 0;

foreach (@lines)
{
#      print $_;
	my $testString = $_;
	my $strlen = length($testString) / 2;
	my $first = substr($testString,0,$strlen);
	my $rest = substr($testString, $strlen,$strlen * 2);
	$prio_result +=  findcommon($first,$rest);
}
print($prio_result);
#my $testString = 'vJrwpWtwJgWrhcsFMMfFFhFp';
#my @test = split(//,$testString);
#my $strlen = length($testString) / 2;
#get first part
#my $first = substr($testString,0,$strlen);
#my $rest = substr($testString, $strlen,$strlen * 2);
#print findcommon($first,$rest);

