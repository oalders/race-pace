package RacePace::MaximumHeartRate;

use Moo;

use Types::Common::Numeric qw( PositiveNum );

has age => (
    is       => 'ro',
    isa      => PositiveNum,
    required => 1,
);

sub conventional {
    my $self = shift;
    return 220 - $self->age;
}

sub tanaka {
    my $self = shift;
    return 208 - 0.7 * $self->age;
}

sub gellish {
    my $self = shift;
    return 207 - 0.7 * $self->age;
}

1;

#ABSTRACT: Common maximum heart rate predictors

=head1 DESCRIPTION

L<http://www.runnersworld.com/ask-the-sports-doc/what-is-my-maximum-heart-rate>

=cut
