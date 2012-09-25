use strict;
use warnings;
use Test::More tests => 5;
BEGIN { use_ok('Statistics::EfficiencyCI') };
Statistics::EfficiencyCI->import(qw(efficiency_ci log_gamma));

my ($mode, $low, $high) = efficiency_ci(4, 145, 0.954);
pass();
# TODO: Write proper tests, lazy guy!

#warn "$low <= $mode <= $high";
#my $s = binomial_eff_uncert(4,145, 2);
#warn( ($mode-$s) . " <= $mode <= " . ($mode+$s) );

ok(float_eq(log_gamma(2), log(1)), "log_gamma(2) correct");
ok(float_eq(log_gamma(3), log(2)), "log_gamma(3) correct");
ok(float_eq(log_gamma(4), log(2*3)), "log_gamma(4) correct");

sub float_eq { $_[0] + 1e-9 > $_[1] && $_[0] - 1e-9 < $_[1] }

sub binomial_eff_uncert {
  my $n = shift;
  my $N = shift;
  my $nsigma = shift||1;
  my $sigma = sqrt($n*(1-$n/$N))/$N;
  return $sigma*$nsigma;
}

