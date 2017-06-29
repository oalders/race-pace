use strict;
use warnings;

use Test::More;

use RacePace::Pace2Time;

my $calc
    = RacePace::Pace2Time->new( distance => '10k', pace => '4:30');

is( $calc->total_time, '00:45:00' );

done_testing;
