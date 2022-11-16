use strict;
use warnings;
use feature qw( say );

use DateTime;
use DateTime::Duration;

my $now = DateTime->now->truncate( to => 'day' );
my $start = $now->clone;
$start->set( hour => 9, minute => 6 );
say 'begin swim', "\t", $start->hms;

my @timing = (
    [ 18, 6,  'begin T1' ],      # swim
    [ 4,  0,  'begin bike' ],    # T1
    [ 55, 8,  'begin T2' ],      # bike
    [ 0,  58, 'begin run' ],     # T2
    [ 39, 7,  'finish run' ],    # run
);

for my $segment (@timing) {
    my $timing = DateTime::Duration->new(
        minutes => $segment->[0],
        seconds => $segment->[1],
    );
    $now->add($timing);
    $start->add($timing);
    say sprintf(
        "%s:%s\n%s\t%s", $segment->[0],
        $segment->[1], $segment->[2], $start->hms,
    );
}

say "total time\t", $now->hms;
