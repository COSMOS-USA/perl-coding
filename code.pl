use strict;
use warnings;

my $file = "apache_access.log";
open my $fh, '<', $file or die "Could not open '$file' : $!";

my $myip = 0;
my $anotherip = 0;

while (my $line = <$fh>) {
    chomp $line;
    my $length = index ($line, " ");
    my $ip = substr($line, 0, $length);
    if ($ip eq "127.0.0.1") {
        $myip++;
    }  else {
        $anotherip++;
    }
}

print "MyIP: $myip\nAnotherIP: $anotherip\n"