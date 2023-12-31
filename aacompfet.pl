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

open(O1, ">$in1.aacomp");
open(O2, ">$in2.aacomp");

for($i=0; $i<@pos; $i++)
{
	$line = $pos[$i]; chomp($line);
	$len = length($line);
	@arr = split(//, $line);
	$eachpep = "";
	@aacom = qw(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0);
	for($b=0; $b<@arr; $b++)
	{
		for($a=0; $a<@aa; $a++)
		{
			if($aa[$a] eq $arr[$b])
			{
				$aacom[$a]++;
			}
		}
	}
	for($x=0; $x<@aacom; $x++) { $aacom[$x] = ($aacom[$x]*100)/$len; $aacom[$x] = sprintf("%.3f", $aacom[$x]); if($aacom[$x] == 0) { $aacom[$x] = 0; } $aacom[$x] = $aacom[$x] + 0; }
	$eachpep = join(",", @aacom);
	$eachpep =~ s/,$//g;
	print O1 "$eachpep\n";
}


for($i=0; $i<@neg; $i++)
{
	$line = $neg[$i]; chomp($line);
	$len = length($line);
	@arr = split(//, $line);
	$eachpep = "";
	@aacom = qw(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0);
	for($b=0; $b<@arr; $b++)
	{
		for($a=0; $a<@aa; $a++)
		{
			if($aa[$a] eq $arr[$b])
			{
				$aacom[$a]++;
			}
		}
	}
	for($x=0; $x<@aacom; $x++) { $aacom[$x] = ($aacom[$x]*100)/$len; $aacom[$x] = sprintf("%.3f", $aacom[$x]); if($aacom[$x] == 0) { $aacom[$x] = 0; } $aacom[$x] = $aacom[$x] + 0; }
	$eachpep = join(",", @aacom);
	$eachpep =~ s/,$//g;
	print O2 "$eachpep\n";
}

close O1; close O2;
