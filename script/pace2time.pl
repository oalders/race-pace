#!/usr/bin/env perl

use strict;
use warnings;

use RacePace::Pace2Time;

my $rp = RacePace::Pace2Time->new_with_options;

print $rp->total_time, "\n";

# PODNAME: pace2time

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
