for($c=1;$c<6;$c++)
{
    for($d=1;$d<6;$d++)
    {
        if($d==$c)
        {
	    @sfile = ();
	    open(SET, "<set_$d"); @sfile = <SET>; close SET;
	    open(OUT, ">test_$c");
	    for($w=0; $w<@sfile; $w++)
	    {
		chomp($sfile[$w]);
		print OUT "$sfile[$w]\n";
	    }
	    close OUT;
        }
        else
        {
	    @sfile = ();
	    open(SET, "<set_$d"); @sfile = <SET>; close SET;
	    open(WW, ">>train_$c");
	    for($w=0; $w<@sfile; $w++)
	    {
		chomp($sfile[$w]);
		print WW "$sfile[$w]\n";
	    }
	    close WW;
        }
    }
}
