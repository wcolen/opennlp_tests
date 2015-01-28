use strict;
use warnings;

my $num_args = $#ARGV + 1;
if ($num_args != 1) {
    print "\nUsage: extractRes.pl filename\n";
    exit;
}
 
my $filename = $ARGV[0];
open(my $fh, '<:encoding(UTF-8)', $filename)
  or die "Could not open file '$filename' $!";
 
while (my $row = <$fh>) {
  chomp $row;

  if($row =~ /Loading (.+?) model.*?\((.+?)\)/) {
  	my $m = $1;
  	my $l = $2;
  	print "$m: load: $l ";
  }

  if($row =~ /Average: (.+)/) {
  	
  	print "avg: $1\n";
  }

   
}