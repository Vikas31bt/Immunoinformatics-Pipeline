if($ARGV[0] eq "")
{
	print "\n\tprog.pl [number for each set]\n";
	exit;
}

$n = $ARGV[0];

for($i=1; $i<=5; $i++)
{
	open(FF, "<set_$i"); @sfile = <FF>; close FF; unlink "set_$i"; open(OO, ">set_$i");
	for($j=0; $j<@sfile; $j++) { chomp($sfile[$j]); print OO "$sfile[$j]\n"; if($j==($n-1)) { last; } }
}
