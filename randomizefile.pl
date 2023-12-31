use Getopt::Std;
getopts('i:o:n:');
$file1 = $opt_i;
$file2 = $opt_o;
$numn = $opt_n;

if($file1 eq "" or $file2 eq "")
{
        print "\tUSAGE: program.pl -i inputfile -o outputfile -n [optional: number]\n";
        print "\tIf -n = 5 then output file will have 5 lines randomly selected from input file\n";
        exit;
}
if($numn eq "") { $numn = -1; }
####### START FROM HERE ##################################################################################
open(FF, "<$file1"); @file = <FF>; close FF;

$wcl_file = @file;
#print "$wcl_file\n";

unshift(@file, "0");

@a = (1..$wcl_file);
#print "@a\n";
@rnum = ();
open(OOO, ">$file2");
for($i=1; $i<=$wcl_file; $i++)
{
        xx:$r = int(rand(@a));
        if($r == 0){ $r = $wcl_file; }
        #print "$r\t";
        if(exists($hash{$r})) { goto xx; }
        if($r<1 or $r>$wcl_file) { print "random number is wrong\n"; }
        push(@{$hash{$r}}, "line");
        #print "$r\n";
        chomp($file[$r]);
        if($i==1) {
                #`sed '$r!d' $file1 > $file2`;
                print OOO "$file[$r]\n";
        }
        else{
                #`sed '$r!d' $file1 >> $file2`;
                print OOO "$file[$r]\n";
        }
if($i == $numn) { last; }
}
close OOO;
