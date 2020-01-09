#!/usr/bin/env perl
  

my $listname = "";
my @hosts = ();
my $counter = 0;
if (($#ARGV + 1) == 1){
    $listname = $ARGV[0];
    chomp(@hosts = <STDIN>);
}
elsif(($#ARGV + 1) == 2) {
    $listname = $ARGV[0];
    chomp(@hosts = <STDIN>);
    $counter = $ARGV[1];
}
else{
    print "Syntax: ./serverclass_list_creator.pl <whitelist|blacklist> [start #]\n";
    print "example: cat <server list> | perl serverclass_list_creator.pl whitelist 20\n";
    exit;
}
foreach my $host (@hosts){
    print "$listname.$counter = $host\n";
    $counter++;
