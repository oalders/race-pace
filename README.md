# NAME

RacePace - Race pace calculations for runners

# VERSION

version 0.000001

# SYNOPSIS

\# How long will I take to run a 5k if my average 1km split is 4:30?
    perl pace2time.pl --distance 5k --pace 4:30 # 0:22:30

\# How long will I take to run 5 miles if my average 1km split is 4:30?
    perl pace2time.pl --distance 5mi --pace 4:30 # 0:36:12.61

\# How long will I take to run a marathon if my average 1km split is 4:30?
    perl pace2time.pl --distance marathon --pace 4:30 # 3:09:52.65

\# What pace should I target to complete a 10k in 45 minutes?
    perl -Ilib script/time2pace.pl --distance 10k --total-time 45:00

# AUTHOR

Olaf Alders <olaf@wundercounter.com>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2017 by Olaf Alders.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
