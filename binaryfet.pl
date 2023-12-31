if($ARGV[0] eq "")
{
	print "\n\tprog.pl [input positive file] [input negative file]\n";
	exit;
}

$in1 = $ARGV[0];
$in2 = $ARGV[1];
@aa = qw(A C D E F G H I K L M N P Q R S T V W Y);

############################################################################################
open(F1, "<$in1"); @pos = <F1>; close F1;
open(F2, "<$in2"); @neg = <F2>; close F2;

open(O1, ">$in1.binary");
open(O2, ">$in2.binary");

for($i=0; $i<@pos; $i++)
{
	$line = $pos[$i]; chomp($line);
	@arr = split(//, $line);
	$eachpep = "";
	for($b=0; $b<@arr; $b++)
	{
		@binary = qw(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0);
		for($a=0; $a<@aa; $a++)
		{
			if($aa[$a] eq $arr[$b])
			{
				$binary[$a] = 1;
			}
		}
		$binfet = join(",", @binary);
		$binfet =~ s/,$//g;
		#print "$binfet\n";
		$eachpep .= "$binfet,";
	}
	$eachpep =~ s/,$//g;
	print O1 "$eachpep\n";
}


for($i=0; $i<@neg; $i++)
{
	$line = $neg[$i]; chomp($line);
	@arr = split(//, $line);
	$eachpep = "";
	for($b=0; $b<@arr; $b++)
	{
		@binary = qw(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0);
		for($a=0; $a<@aa; $a++)
		{
			if($aa[$a] eq $arr[$b])
			{
				$binary[$a] = 1;
			}
		}
		$binfet = join(",", @binary);
		$binfet =~ s/,$//g;
		#print "$binfet\n";
		$eachpep .= "$binfet,";
	}
	$eachpep =~ s/,$//g;
	print O2 "$eachpep\n";
}

close O1; close O2;
