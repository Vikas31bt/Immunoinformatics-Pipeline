$file1=$ARGV[0];
$file2=$ARGV[1];
$file3=$ARGV[2];
open(CAT,"$file1");
while($line=<CAT>)
{
    chomp($line);
    @amino1 = split(/\s+/,$line);
    $aa[$i]=$amino1[0];
    $i++;
}
close CAT;
open(GAT,"$file2");
while($bin=<GAT>)
{
    chomp($bin);
    $bb[$j]=$bin;
    $j++;
}
close GAT;
open(DAG,">>$file3");

for($a=0;$a<=1.0;$a=$a+0.1)
{
    $tp=$tn=$fp=$fn=0;
    for($b=0;$b<@aa;$b++)
    {
        if(($aa[$b] eq "+1") && ($bb[$b]>=$a))
        {
            $tp++;
        }
        if(($aa[$b] eq "-1") && ($bb[$b]<$a))
        {
            $tn++;
        }
        if(($aa[$b] eq "+1") && ($bb[$b]<$a))
        {
            $fn++;
        }
        if(($aa[$b] eq "-1") && ($bb[$b]>=$a))
        {
            $fp++;
        }

    }


    $binder=$tp+$fn;
    $nonb=$tn+$fp;
    #print "$binder\t$nonb\n";
    print DAG"$a\t$tp\t$fp\t$tn\t$fn\t";

        if(($tp+$fp)==0) { $ppv = 0; $fpr = 0; } else { $ppv = $tp/($tp+$fp); $fpr = $fp/($tp+$fp); }
        if(($tn+$fn)==0) { $npv = 0; $fnr = 0; } else { $npv = $tn/($tn+$fn); $fnr = $fn/($tn+$fn); }


    $total=$tp+$fp+$tn+$fn;
    if($binder!=0)
    {
        $sensitivity=$tp/($binder)*100;
    }
    else
    {$sensitivity=0;}
    if($nonb!=0)
    {
        $specificity=$tn/($nonb)*100;
    }
    else
    {$specificity=0;}

    $accuracy=(($tp+$tn)/$total)*100;
    if((($tp+$fn)*($tp+$fp)*($fn+$fp)*($tn+$fn))!=0)
    {
        $mcc=($tp*$tn-$fp*$fn)/(($tn+$fn)*($tp+$fn)*($tn+$fp)*($tp+$fp))**0.5;
    }
    else
    {
        $mcc=0;
    }
    printf DAG"%4.2f",$sensitivity;
    print DAG"\t";
    printf DAG"%4.2f",$specificity;
    print DAG"\t";

    printf DAG"%4.2f",$accuracy;
    print DAG"\t";
    printf DAG"%4.2f",$mcc;
    print DAG"\t";
    printf DAG"%4.2f\t",$ppv; printf DAG"%4.2f\t",$fpr; printf DAG"%4.2f\t",$npv; printf DAG"%4.2f\n",$fnr;
}
close DAG;
