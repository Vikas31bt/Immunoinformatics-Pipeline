if($ARGV[0] eq "" or $ARGV[1] eq "")
{
        print "\tprog.pl [input file] [1 for class and 2 for reg]\n";
        exit;
}
$file1=$ARGV[0];
open(FP1,"$file1");
#open(FP2,">$file2");
while($t1=<FP1>){
    chomp($t1);
    open(FP1,"$file1");print "@"."RELATION 'patterns'\n\n";
while($t1=<FP1>){
    chomp($t1);
    if(index($t1,"#") != 0){
        @t2 = split(" ",$t1);
    }
}
for($i=1;$i<@t2;$i++)
{
    print "@"."ATTRIBUTE F$i REAL\n";
}
if($ARGV[1] == 1) {print "@"."ATTRIBUTE class\t{+1,-1}\n\n";}
if($ARGV[1] == 2) {print "@"."ATTRIBUTE {REAL}\n\n";}
print "@"."DATA\n";
close FP1;
}
open(FP, "$file1");
while($line=<FP>)
{
    chomp($line);
    @aa1=split(/\s+/, $line);
    for($i=1;$i<@aa1; $i++)
    {
        @aa2=split(/:/,$aa1[$i]);
        print "$aa2[1],";
    }
    print "$aa1[0]\n";
}
