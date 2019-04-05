#!/usr/bin/perl

use strict;
use warnings;

use Sys::Syslog qw(:standard :macros setlogsock);

# my $dest_host = "servername1.example.com";
# my $dest_host = "servername2.example.com";
# my $dest_host = "159.33.100.29";
# my $dest_host = "servername3.example.com";
# my $dest_host = "192.168.4.125";
## my $dest_host = "10.20.112.15";
my $dest_host = 'servername4.example.com';
my $dest_port = "514";
my $dest_proto = "udp";
# my %s_options = {type => $dest_proto, port => $dest_port, host => $dest_host};
my $counter = 0;
while(1){
  openlog("amtdeb testdaemon");
  setlogsock({type => $dest_proto, port => $dest_port, host => $dest_host});
  
  # setlogsock(\%s_options);
  syslog('info|local2',$counter++ . 'this is a test syslog message');
  closelog;
  sleep 2;
  # openlog("c123example named[1234]");
  # setlogsock({type => $dest_proto, port => $dest_port, host => $dest_host});
  # syslog('info|local4','client 1.2.3.4 this is a message query: a.bcd.com');
  # closelog;
  # sleep 2;
}