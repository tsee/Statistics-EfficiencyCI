package Statistics::EfficiencyCI;

use 5.008001;
use strict;
use warnings;

our $VERSION = '0.01';

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(
  efficiency_ci
);
our @EXPORT_TAGS = ('all' => \@EXPORT_OK);

require XSLoader;
XSLoader::load('Statistics::EfficiencyCI', $VERSION);

1;
__END__

=head1 NAME

Statistics::EfficiencyCI - Robust confidence intervals on efficiencies

=head1 SYNOPSIS

  use Statistics::EfficiencyCI qw(efficiency_ci);
  my $confidence_level = 0.683;
  my ($mode, $lower_cl, $upper_cl) = efficiency_ci($k, $N, $confidence_level);
  
  # With default confidence level of "1sigma" == 0.683
  my ($mode, $lower_cl, $upper_cl) = efficiency_ci($k, $N);

=head1 DESCRIPTION

This module implements robust confidence interval calculations on efficiency-like
quantities. The algorithm is explained in the note by Marc Paterno linked in the
references below.

The employed method does not suffer from the usual boundary issue of the uncertainty
calculation based on the Binomial model: At an efficiency C<e = k/N> with small
C<k>, the confidence interval will be asymmetric and will not go below C<0>,
which the simple calculation based on the Binomial PDF will for confidence
levels above the equivalent of one sigma. It also does not suffer from the
problem that the uncertainty vanishes at C<k=0> and C<k=N>.

=head2 EXPORTS

This module will optionally export the C<efficiency_ci> function.

=head1 SEE ALSO

Marc Paterno's note on calculating the uncertainty on
an efficiency: :<http://home.fnal.gov/~paterno/images/effic.pdf>

The ROOT library's website: L<http://root.cern.ch>

=head1 AUTHOR

Author of the Perl glue code is Steffen Mueller, E<lt>smueller@cpan.orgE<gt>.

Author of the method of calculating the confidence intervals
and its implementation is Marc Paterno.

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2011 by Steffen Mueller

Most of the code is taken from the ROOT library (licensed under LGPL) and
by proxy, the CEPHES library (licensed with a modified BSD license). The full list
of ROOT authors can be found on the ROOT website L<http://root.cern.ch>.

This library is free software; you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License (LGPL).
You can find a full copy of the license in the F<LICENSE> file
in this distribution.

=cut
