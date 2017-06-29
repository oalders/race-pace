#!/usr/bin/env perl

use strict;
use warnings;
use feature qw( say );

package RacePace;

use Moo;
use MooX::Options;
with 'RacePace::Role::Common';

1;

# ABSTRACT: Race pace calculations for runners

=head1 SYNOPSIS

# How long will I take to run a 5k if my average 1km split is 4:30?
    perl pace2time.pl --distance 5k --pace 4:30 # 0:22:30

# How long will I take to run 5 miles if my average 1km split is 4:30?
    perl pace2time.pl --distance 5mi --pace 4:30 # 0:36:12.61

# How long will I take to run a marathon if my average 1km split is 4:30?
    perl pace2time.pl --distance marathon --pace 4:30 # 3:09:52.65

# What pace should I target to complete a 10k in 45 minutes?
    perl -Ilib script/time2pace.pl --distance 10k --total-time 45:00

=cut
