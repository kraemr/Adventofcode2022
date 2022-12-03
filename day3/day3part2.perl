# man i really like cooking up some perl code 
#⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
#⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
#⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢺⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
#⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠆⠜⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
#⣿⣿⣿⣿⠿⠿⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣿⣿⣿⣿⣿
#⣿⣿⡏⠁⠀⠀⠀⠀⠀⣀⣠⣤⣤⣶⣶⣶⣶⣶⣦⣤⡄⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿
#⣿⣿⣷⣄⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⡧⠇⢀⣤⣶⣿⣿⣿⣿⣿⣿⣿
#⣿⣿⣿⣿⣿⣿⣾⣮⣭⣿⡻⣽⣒⠀⣤⣜⣭⠐⢐⣒⠢⢰⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿
#⣿⣿⣿⣿⣿⣿⣿⣏⣿⣿⣿⣿⣿⣿⡟⣾⣿⠂⢈⢿⣷⣞⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿
#⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣷⣶⣾⡿⠿⣿⠗⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
#⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠻⠋⠉⠑⠀⠀⢘⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
#⣿⣿⣿⣿⣿⣿⣿⡿⠟⢹⣿⣿⡇⢀⣶⣶⠴⠶⠀⠀⢽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
#⣿⣿⣿⣿⣿⣿⡿⠀⠀⢸⣿⣿⠀⠀⠣⠀⠀⠀⠀⠀⡟⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
#⣿⣿⣿⡿⠟⠋⠀⠀⠀⠀⠹⣿⣧⣀⠀⠀⠀⠀⡀⣴⠁⢘⡙⢿⣿⣿⣿⣿⣿⣿⣿⣿
#⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢿⠗⠂⠄⠀⣴⡟⠀⠀⡃⠀⠉⠉⠟⡿⣿⣿⣿⣿
#⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢷⠾⠛⠂⢹⠀⠀⠀⢡⠀⠀⠀⠀⠀⠙⠛⠿⢿

use strict;
use warnings;


my $file = 'input.txt';
open(INFO,$file);

#assign the array of lines
my @lines = <INFO>;
#close file handle 
close(INFO); 
sub findoccurences
{
	#this is the char to look for 
	my $chr = $_[0]; 
	#input str
	my $str = $_[1];
	# finds occurence count of char with regex
	my $count = () = $str =~ /\Q$chr/g;
	return $count;
}

#get the priorities of the different item types
# if ascii value is bigger than 96 then charvalue - 96 is prio
# if ascii value is < than 96 then char value - 38 is prio
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
	my $char = '';	
	my $prio_sum = 0;
	
	foreach $char (split //, $fst_compartment)
	{
	  if(findoccurences($char,$snd_compartment) > 0){
	   	$prio_sum = getprio($char);
		last;
	  }	
	  else {
	  	# does not contain the char
	  }
	}
	return $prio_sum;
}

sub part2compare{
	#takes three strs in an array
	my @arr = @{$_[0]}; 
	# we dont need to split into compartments here
	my $char = '';	
	foreach	$char (split //, $arr[0])
	{
		if(findoccurences( $char,$arr[1]) > 0 && findoccurences( $char,$arr[2]) > 0 )
		{
			return getprio($char);
		}
	}
}

#loop through the input file line by line 
my $prio_result = 0;
# get 6 lines each iteration and split into two string arrays
#first array has group 1 second has group 2
#foreach group find the itemtype that each of their backpacks contains
for(my $i = 5; $i <= ($#lines);$i+=6 )
{
	my @groupone = ($lines[$i-5], $lines[$i-4], $lines[$i-3]);
	my @grouptwo = ($lines[$i-2], $lines[$i-1], $lines[$i] );
	# \ means passing as reference, add the two prio results together and add it to prio_result
	$prio_result += part2compare(\@groupone) + part2compare(\@grouptwo);
}
print("\n end result: ",$prio_result);

