if($ARGV[0] eq "")
{
	print "\n\tprog.pl [input mix file]\n";
	exit;
}

if(-e "set_1") { unlink "set_1"; }
if(-e "set_2") { unlink "set_2"; }
if(-e "set_3") { unlink "set_3"; }
if(-e "set_4") { unlink "set_4"; }
if(-e "set_5") { unlink "set_5"; }

$file1=$ARGV[0];
$i=0;
open(MAN,"$file1");
open(SET1, ">>set_1");
open(SET2, ">>set_2");
open(SET3, ">>set_3");
open(SET4, ">>set_4");
open(SET5, ">>set_5");

while($line=<MAN>)
{
    chomp($line);
    $i++;
    $k=$i%5;
    if($k==1)
    {
        #open(MAT,">>set_1");
        print SET1 "$line\n";
        #close MAT;
    }
    if($k==2)
    {
        #open(MAT,">>set_2");
        print SET2 "$line\n";
        #close MAT;
    }
    if($k==3)
    {
        #open(MAT,">>set_3");
        print SET3 "$line\n";
        #close MAT;
    }
    if($k==4)
    {
        #open(MAT,">>set_4");
        print SET4 "$line\n";
        #close MAT;
    }
    if($k==0)
    {
        #open(MAT,">>set_5");
        print SET5 "$line\n";
        #close MAT;
    }

}
close SET1; close SET2; close SET3; close SET4; close SET5; close MAN;
