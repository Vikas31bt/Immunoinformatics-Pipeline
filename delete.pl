

for($i=1; $i<=5; $i++)
{
	unlink "set_$i";
	unlink "test_$i";
	unlink "train_$i";
}

unlink "train.mix";
unlink "test.mix";
unlink "train.pos.svm";
unlink "train.neg.svm";
unlink "test.pos.svm";
unlink "test.neg.svm";
unlink "train.pos.aacom";
unlink "train.neg.aacom";
unlink "test.pos.aacom";
unlink "test.neg.aacom";