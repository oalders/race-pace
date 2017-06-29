use strict;
use warnings;

use Test::More;

use RacePace::MaximumHeartRate;

my $mhr = RacePace::MaximumHeartRate->new( age => 45 );

is( $mhr->conventional, 175, 'conventional' );
is( $mhr->tanaka,       176.5, 'tanaka' );
is( $mhr->gellish,      175.5, 'gellish' );

done_testing;
