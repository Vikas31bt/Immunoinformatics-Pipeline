if($ARGV[0] eq "")
{
        print "\tperl $0 [input arff file]\n";
        #print "\n";
        exit;
}

#use List::Util qw[min max];

#print "\n\tUse this program as template to start programming and modify it as per your needs\n\n"; exit;
#$dat1 = `date`;
#print "\tprogram start at $dat1";
####### START FROM HERE ##################################################################################
$infile = $ARGV[0];

open(FF, "<$infile");
@file = <FF>; close FF;

for($i=0; $i<@file; $i++)                       #1. for loop 1 --> reads file or list file
{
        $line = $file[$i];      chomp($line);
        if($line =~ /relation/i) { next; }
        if($line =~ /attribute/i) { next; }
        if($line =~ /data/i) { next; }
        #print "$line\n"; exit;
        @arr = split(/,/, $line);
        $lastele = $arr[-1];
        pop(@arr);
        $strr = "";
        for($a=0; $a<@arr; $a++)                #2 for loop 1.1 --> reads each element of line using arr
        {
                $a1 = $a+1;
                $eachele = $arr[$a];
                $strr = $strr."$a1:$eachele ";
        }
        $finalstr = "$lastele $strr";
        print "$finalstr\n";
}

####### END HERE #########################################################################################
#$dat2 = `date`;
#print "\tprogram ended at $dat2";
#exit;
