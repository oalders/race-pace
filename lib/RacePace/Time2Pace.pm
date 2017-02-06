package RacePace::Time2Pace;

use Moo;
use MooX::Options;

use Types::Standard qw( Str );

with 'RacePace::Role::Common';

has pace => (
    is      => 'ro',
    isa     => Str,
    lazy    => 1,
    builder => '_build_pace',
);

option total_time => (
    is       => 'ro',
    format   => 's',
    required => 1,
    doc      => 'Time elapsed for distance in MM::SS or HH:MM::SS',
);

sub _build_pace {
    return sprintf '%d:%02d:%02s', 0, 0, 0;
}

1;
