use strict;
use warnings;
use Test::More tests => 2;
BEGIN { use_ok('Statistics::EfficiencyCI') };
Statistics::EfficiencyCI->import('efficiency_ci');

my ($mode, $low, $high) = efficiency_ci(4, 145, 0.954);
pass();
# TODO: Write proper tests, lazy guy!

#warn "$low <= $mode <= $high";
#my $s = binomial_eff_uncert(4,145, 2);
#warn( ($mode-$s) . " <= $mode <= " . ($mode+$s) );

sub binomial_eff_uncert {
  my $n = shift;
  my $N = shift;
  my $nsigma = shift||1;
  my $sigma = sqrt($n*(1-$n/$N))/$N;
  return $sigma*$nsigma;
}

