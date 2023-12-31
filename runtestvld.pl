if(!(-e "test_all")) { print "\n\ttest_all file not found in pwd... Exiting\n\n"; exit; }
if(!(-e "modelall")) { print "\n\tmodelall file not found in pwd... Exiting\n\n"; exit; }

@g=(1);
@c=(1);
@j=(1);

for($i=0;$i<@g;$i++)
{
    for($i1=0;$i1<@c;$i1++)
    {
        for($i2=0;$i2<@j;$i2++)
        {

            open(FP,">>OUT");
            print FP"\ng:$g[$i] c:$c[$i1] j:$j[$i2]\n";
            print FP "**************************************\n";

            for($s=1;$s<=1;$s++)
            {
                print "Now runnig for model$s at -z c -t 2 -g $g[$i] -c $c[$i1] -j $j[$i2]\n";

                system "~/svm_classify.exe test_all modelall results$s ";
                system "cat results$s>>RESULT";

                system "cat test_all >> TESTSET";
                system "rm results$s";
            }


                        system "cut -d ' ' -f1 TESTSET > testset1";
                        system "paste -d ' ' testset1 RESULT > data";
                $roc = "";
                $roc = `~/perf.exe -roc < data | perl -pi -e 's/ROC//g' | perl -pi -e 's/ //g'`;
                print FP "\tROC value\t$roc\n";

            print "perl accuracy1.pl TESTSET RESULT  OUT\n";
            system "perl accuracy1.pl TESTSET RESULT OUT";
            print "perl accuracy.pl TESTSET RESULT  OUT\n";
            system "perl accuracy.pl TESTSET RESULT OUT";
            system "rm TESTSET RESULT testset1 data";
            close FP;
        }
    }

}
