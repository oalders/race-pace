package RacePace::Role::Common;

use Moo::Role;

use CLDR::Number::Format::Decimal ();
use DateTime ();
use MooX::Options;
use Types::Standard qw( Num Str );

option distance => (
    is       => 'ro',
    format   => 's',
    required => '1',
    doc      => 'output distance',
);

option units => (
    is      => 'ro',
    format  => 's',
    default => 'km',
    doc     => 'Units for output distance',
);

has distance_as_km => (
    is      => 'ro',
    isa     => Num,
    builder => '_build_distance_as_km',
);

has mi_to_km => (
    is      => 'ro',
    isa     => Num,
    default => 1.60934,
    lazy    => 1,
);

sub _build_distance_as_km {
    my $self         = shift;
    my %string_to_km = (
        marathon        => 42.195,
        'half-marathon' => 21.0975
    );

    my $distance = $self->distance;

    if ( exists $string_to_km{$distance} ) {
        return $string_to_km{$distance};
    }

    if ( $distance =~ m{\A([\d\.]*)(k|km|mi)\z} ) {
        $distance = $1;
        my $units = $2;
        return $units eq 'mi' ? $distance * $self->mi_to_km : $distance;
    }

    if ( $distance !~ m{[^\w]} ) {

        # default to km
        return $distance;
    }

    die "cannot parse $distance";
}

1;
