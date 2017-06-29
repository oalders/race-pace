use strict;
use warnings;

use Test::More;

use RacePace::Time2Pace;

my $calc
    = RacePace::Time2Pace->new( distance => '10k', total_time => '45:00' );

is( $calc->pace, '4:30/km' );
diag $calc->pace;

done_testing;
