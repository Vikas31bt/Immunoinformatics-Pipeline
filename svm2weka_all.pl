


for($i=1; $i<=5; $i++)
{
	system "perl svm2weka.pl test_$i 1 > test_$i.arff";
	system "perl svm2weka.pl train_$i 1 > train_$i.arff";
}
