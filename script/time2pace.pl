#!/usr/bin/env perl

use strict;
use warnings;

use RacePace::Time2Pace;

my $rp = RacePace::Time2Pace->new_with_options;

print $rp->pace, "\n";

=pod

=head1 SYNOPSIS

    pace2time --distance 5k --split 5:30
    # returns 0:27:30 (your time to complete 5k with 5:30 splits)

    pace2time --distance 5k --split 5:30
    # same as above

    pace2time --distance 5km --split 5:30
    # same as above

    pace2time --distance 5mi --split 5:30

    pace2time --distance marathon --split 5:30

    pace2time --distance half-marathon --split 5:30

=cut
