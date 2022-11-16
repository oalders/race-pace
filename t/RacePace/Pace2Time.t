use strict;
use warnings;

use Test2::Bundle::More;
use Test2::Plugin::BailOnFail;

use RacePace::Pace2Time;

my $calc = RacePace::Pace2Time->new( distance => '10k', pace => '4:30' );

is( $calc->total_time, '00:45:00' );

my @tests = (
    [
        { distance   => 'marathon', pace => '5:30' },
        { total_time => '03:52:04' }
    ],
    [
        { distance   => 'half-marathon', pace => '5:30' },
        { total_time => '01:56:02' }
    ],
    [
        { distance   => '5', pace => '5:30' },
        { total_time => '00:27:30' }
    ],
    [
        { distance   => '5k', pace => '5:30' },
        { total_time => '00:27:30' }
    ],
    [
        { distance   => '5km', pace => '5:30' },
        { total_time => '00:27:30' }
    ],
    [
        { distance   => '5.5km', pace => '5:30' },
        { total_time => '00:30:15' }
    ],
    [
        { distance   => '5mi', pace => '5:30' },
        { total_time => '00:44:15' }
    ],
);

foreach my $test (@tests) {
    my $pacer = RacePace::Pace2Time->new( $test->[0] );
    is(
        $pacer->total_time, $test->[1]->{total_time},
        'total_time for ' . $test->[0]->{distance}
    );
}

my $pacer = RacePace::Pace2Time->new( distance => '10mi', pace => '5' );
is( $pacer->distance_as_km, '16.0934', 'distance_as_km' );

done_testing;
