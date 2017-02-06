package RacePace::Pace2Time;

use Moo;
use MooX::Options;

use Types::Standard qw( Str );

with 'RacePace::Role::Common';

option pace => (
    is       => 'ro',
    format   => 's',
    required => '1',
    doc      => 'A 1km split time',
);

has total_time => (
    is      => 'ro',
    isa     => Str,
    lazy    => 1,
    builder => '_build_total_time',
);

sub _build_total_time {
    my $self = shift;
    my ( $minutes, $seconds ) = split( m{:}, $self->pace );

    my $km = $self->distance_as_km;

    my $total_seconds = $seconds * $km + $minutes * 60 * $km;

    my $total_minutes = $total_seconds ? int( $total_seconds / 60 ) : 0;
    $total_seconds -= $total_minutes * 60;

    my $total_hours = $total_minutes ? int( $total_minutes / 60 ) : 0;
    $total_minutes -= $total_hours * 60;

    my $formatter = CLDR::Number::Format::Decimal->new(
        locale                  => 'en-US',
        maximum_fraction_digits => 0,
    );

    return sprintf '%d:%02d:%02s',
        $formatter->format($total_hours),
        $formatter->format($total_minutes),
        $formatter->format($total_seconds);
}

1;
