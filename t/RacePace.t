use strict;
use warnings;

use RacePace;
use Test2::Bundle::More;

my @tests = (
    [
        { distance   => 'marathon', pace => '5:30' },
        { total_time => '3:52:04' }
    ],
    [
        { distance   => 'half-marathon', pace => '5:30' },
        { total_time => '1:56:02' }
    ],
    [
        { distance   => '5', pace => '5:30' },
        { total_time => '0:27:30' }
    ],
    [
        { distance   => '5k', pace => '5:30' },
        { total_time => '0:27:30' }
    ],
    [
        { distance   => '5km', pace => '5:30' },
        { total_time => '0:27:30' }
    ],
    [
        { distance   => '5mi', pace => '5:30' },
        { total_time => '0:44:15' }
    ],
);

foreach my $test (@tests) {
    my $pacer = RacePace->new( $test->[0] );
    is(
        $pacer->total_time, $test->[1]->{total_time},
        'total_time for ' . $test->[0]->{distance}
    );
}

my $pacer = RacePace->new( distance => '10mi', pace => '5' );
is( $pacer->distance_as_km, '16.0934', 'distance_as_km' );

done_testing();
