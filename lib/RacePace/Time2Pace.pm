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
    my $self  = shift;
    my @parts = split( m{:}, $self->total_time );
    my $time  = pop @parts;
    if (@parts) {
        $time += pop(@parts) * 60;
    }
    if (@parts) {
        $time += pop(@parts) * 60 * 60;
    }

    my $pace = $time / $self->distance_as_km;
    my $minutes;

    if ( $pace / 60 >= 1 ) {
        $minutes = int( $pace / 60 );
        $pace -= $minutes * 60;
    }

    return sprintf( '%i:%.2d/km', $minutes || '00', $pace || '00' );
}

1;
