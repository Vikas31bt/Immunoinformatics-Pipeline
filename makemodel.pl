if($ARGV[2] eq "")
{
        print "\n\tprog.pl [input g] [input c] [input j]\n";
        print "\ttrain_all should be present as one training file\n\n";
        exit;
}

if(!(-e "train_all")) { print "\n\ttrain_all file not found in pwd... Exiting\n\n"; exit; }

push(@g, $ARGV[0]);
push(@c, $ARGV[1]);
push(@j, $ARGV[2]);

for($i=0;$i<@g;$i++)
{
    for($i1=0;$i1<@c;$i1++)
    {
        for($i2=0;$i2<@j;$i2++)
        {
                print "Now runnig for model$s at -z c -t 2 -g $g[$i] -c $c[$i1] -j $j[$i2]\n";
                system "~/svm_learn.exe -z c -t 2 -g $g[$i] -c $c[$i1] -j $j[$i2] train_all modelall";
        }
    }

}
