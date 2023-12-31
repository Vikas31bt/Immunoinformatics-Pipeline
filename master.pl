@g=(0.0001, 0.0005, 0.001, 0.005, 0.01, 0.05, 0.1, 0.5, 1);
@c=(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
@j=(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

for($i=0;$i<@g;$i++)
{
    for($i1=0;$i1<@c;$i1++)
    {
        for($i2=0;$i2<@j;$i2++)
        {

            open(FP,">>OUTsvm");
            print FP"\ng:$g[$i] c:$c[$i1] j:$j[$i2]\n";
            print FP "**************************************\n";

            for($s=1;$s<=5;$s++)
            {
                print "Now runnig for model$s at -z c -t 2 -g $g[$i] -c $c[$i1] -j $j[$i2]\n";
                system "~/svm_learn.exe -z c -t 2 -g $g[$i] -c $c[$i1] -j $j[$i2] train_$s modelsvm$s";

                system "~/svm_classify.exe test_$s modelsvm$s resultsvm$s ";
                system "cat resultsvm$s>>RESULTsvm";

                system "cat test_$s>>TESTSETsvm";
                unlink "modelsvm$s";
                unlink "resultsvm$s";
            }


                        system "cut -d ' ' -f1 TESTSETsvm > testset1svm";
                        system "paste -d ' ' testset1svm RESULTsvm > datasvm";
                $roc = "";
                $roc = `~/perf.exe -roc < datasvm | perl -pi -e 's/ROC//g' | perl -pi -e 's/ //g'`;
                print FP "\tROC value\t$roc\n";

            print "perl accuracy1.pl TESTSETsvm RESULTsvm  OUTsvm\n";
            system "perl accuracy1.pl TESTSETsvm RESULTsvm OUTsvm";
            print "perl accuracy.pl TESTSETsvm RESULTsvm  OUTsvm\n";
            system "perl accuracy.pl TESTSETsvm RESULTsvm OUTsvm";
	    unlink "TESTSETsvm";
	    unlink "RESULTsvm";
	    unlink "datasvm";
	    unlink "testset1svm";
            close FP;
        }
    }

}
