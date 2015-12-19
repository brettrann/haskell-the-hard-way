#!/usr/bin/env perl

use List::Util qw( reduce );

sub evenSum { reduce {$a+$b} grep {not $_%2} @_ }

print evenSum(1,2,3,4,5), $/;
