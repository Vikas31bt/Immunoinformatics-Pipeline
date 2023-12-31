if($ARGV[0] eq "")
{
	print "\tprog.pl [input pos dataset file] [input neg dataset file] [split dataset: 0.9 for 90/10, 0.8 for 80/20, 0.75 for 75/25 and so on]\n";
	exit;
}


$inpos = $ARGV[0];
$inneg = $ARGV[1];
$trset = $ARGV[2];
###########################################
open(FPOS, "<$inpos"); @ipos = <FPOS>; close FPOS;
open(FNEG, "<$inneg"); @ineg = <FNEG>; close FNEG;
$wclpos = @ipos;
$wclneg = @ineg;
$ptr = int($wclpos*$trset); $pte = $wclpos-$ptr;
$ntr = int($wclneg*$trset); $nte = $wclneg-$ntr;
#print "$wclpos\t$ptr\t$pte\n";
#print "$wclneg\t$ntr\t$nte\n";

`perl randomizefile.pl -i $inpos -o pos.mix`;
`perl randomizefile.pl -i $inneg -o neg.mix`;

`head -$ptr pos.mix > train.pos`;
`head -$ntr neg.mix > train.neg`;
`tail -n $pte pos.mix > test.pos`;
`tail -n $nte neg.mix > test.neg`;
