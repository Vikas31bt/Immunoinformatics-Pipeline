#############################################################################
##    'col2svm' is free software: you can redistribute it and/or modify      #
##    it under the terms of the GNU General Public License as published by   #
##    the Free Software Foundation, either version 3 of the License, or      #
##    (at your option) any later version.                                    #
##############################################################################
##    This program is distributed in the hope that it will be useful,        #
##    but WITHOUT ANY WARRANTY; without even the implied warranty of         #
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the          #
##    GNU General Public License for more details.                           #
##                                                                           #
##    You should have received a copy of the GNU General Public License      #
##    along with this program.  If not, see <http://www.gnu.org/licenses/>.  #
##############################################################################
## Orginally developed at Raghava's group <http://www.imtech.res.in/raghava/>#

##############################################################################

#=================================================================
# program developed for generating SVM_light format
# Usage: program -i col_file -o svm_outfile -s symbol
# Usage: program -i col_file -s symbol
#=================================================================

use Getopt::Std;
getopts('i:o:s:');

$file1=$opt_i;
$file2=$opt_o;
$sym=$opt_s;
#--------------------------------------------------------------
if(($opt_i eq '')||($opt_s eq ''))
{
    print "-i\tSequence in column seprated format\n";
    print "-o\tOutput file name\n";
    print "-s\t Symbol +1 for positive set or -1 negative set\n";
    print "Usage: col2svm col_file svm_output symbol\n";
    print "Usage for displaying on screen: col2svm col_file symbol \n";
}
#=================================================================

if(($opt_i ne '')&& ($opt_o ne '') &&($opt_s ne '')){
open(FP1,"$file1");
open(FP2,">$file2");
while($t1=<FP1>){
    chomp($t1);
    if(index($t1,"#") != 0){
    @ti = split(",",$t1);
$count = 0;
    print FP2 "$sym ";
    foreach(@ti){
        $c2 = $_;
        $count++;
	$c2 = sprintf("%.3f", $c2); if($c2 == 0) { $c2 = 0; } $c2 = $c2 + 0;
        #printf(FP2 "%d:%f ",$count,$c2);
	print FP2 "$count:$c2 ";
    }
    print FP2 "\n";
}
}
close FP1;
close FP2;
exit();
}if(($opt_i ne '') &&($opt_s ne '')){
open(FP1,"$file1");
while($t1=<FP1>){
    chomp($t1);
    if(index($t1,"#") != 0){
    @ti = split(",",$t1);
$count = 0;
    print "$sym ";
    foreach(@ti){
        $c2 = $_;
        $count++;
	$c2 = sprintf("%.3f", $c2); if($c2 == 0) { $c2 = 0; } $c2 = $c2 + 0;
        #printf("%d:%-f ",$count,$c2);
	print FP2 "$count:$c2 ";
    }
    print "\n";
}
}
close FP1;

}
# Developed by G P S Raghava on 10 Jan 2009
