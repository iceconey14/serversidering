#!/usr/bin/perl
use strict;
use warnings;
use Text::CSV;
my $csv = Text::CSV->new({ binary => 1 }) or die "failed: " . Text::CSV->error_diag();
open my $fh, '<', 'sites.csv' or die "sites.csv: $!";
my @sites;
while (my $row = $csv->getline($fh)) {
    push @sites, $row->[0];
}
close $fh;
my $action = $ARGV[0];
my $current_index = $ARGV[1] || 0;
my $next_index = ($current_index + 1) % @sites;
my $prev_index = ($current_index - 1) % @sites;
$prev_index += @sites if $prev_index < 0;
if ($action eq 'next') {
    print "Location: $sites[$next_index]\n\n";
} elsif ($action eq 'prev') {
    print "Location: $sites[$prev_index]\n\n";
} elsif ($action eq 'random') {
    my $random_index = int(rand(scalar @sites));
    print "Location: $sites[$random_index]\n\n";
} else {
    print "Content-type: text/plain\n\n";
    print "(&#x28;&#x256F;&#xB0;&#x25A1;&#xB0;&#x29;&#x256F;&#xFE35;&#x2035;&#x2501;&#x2032;)
\n";
}
