#!/usr/bin/env perl

use strict;
use warnings;
use feature qw( say );

package RacePace;

use Moo;
use MooX::Options;

use CLDR::Number::Format::Decimal;
use Types::Standard qw( ArrayRef Num );

option distance => (
    is       => 'ro',
    format   => 's',
    required => '1',
    doc      => 'output distance',
);

option split => (
    is       => 'ro',
    format   => 's',
    required => '1',
    doc      => 'A 1km split time',
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

has total_time => (
    is      => 'ro',
    isa     => ArrayRef,
    lazy    => 1,
    builder => '_build_total_time',
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

    if ( $distance =~ m{\A(\d)(k|km|mi)\z} ) {
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

sub _build_total_time {
    my $self = shift;
    my ( $minutes, $seconds ) = split( m{:}, $self->split );

    my $km = $self->distance_as_km;

    my $total_seconds = $seconds * $km + $minutes * 60 * $km;

    my $total_minutes = $total_seconds ? int( $total_seconds / 60 ) : 0;
    $total_seconds -= $total_minutes * 60;

    my $total_hours = $total_minutes ? int( $total_minutes / 60 ) : 0;
    $total_minutes -= $total_hours * 60;

    my $formatter = CLDR::Number::Format::Decimal->new(
        locale                  => 'en-US',
        maximum_fraction_digits => 2,
    );
    return [
        $formatter->format($total_hours),
        $formatter->format($total_minutes),
        $formatter->format($total_seconds)
    ];
}

package main;

my $rp = RacePace->new_with_options;

say sprintf( '%d:%02d:%02s', @{ $rp->total_time } );
use DDP;
p $rp;

=pod

=head1 SYNOPSIS

    # Args are MM::SS/km and number of km
    perl pace2time.pl 5:44 10

    # Result is 57:20 (Your 10k pace with 5:44 splits)

=cut
