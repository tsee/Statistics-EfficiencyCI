package Statistics::EfficiencyCI;

use 5.008001;
use strict;
use warnings;

our $VERSION = '0.01';

require XSLoader;
XSLoader::load('Statistics::EfficiencyCI', $VERSION);

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Statistics::EfficiencyCI - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Statistics::EfficiencyCI;
  blah blah blah

=head1 DESCRIPTION

=head1 SEE ALSO

The ROOT library's website: L<http://root.cern.ch>

Marc Paterno's note on calculating the uncertainty on
an efficiency: :<http://home.fnal.gov/~paterno/images/effic.pdf>

=head1 AUTHOR

Author of the Perl glue code is Steffen Mueller, E<lt>smueller@cpan.orgE<gt>.

Author of the method of calculating the confidence intervals
and its implementation is Marc Paterno.

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2011 by Steffen Mueller

Some of the code is taken from the ROOT library (licensed under LGPL) and
by proxy, the CEPHES library (licensed with a modified BSD license). The full list
of ROOT authors can be found on the ROOT website L<http://root.cern.ch>.

This library is free software; you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License (LGPL).
You can find a full copy of the license in the F<LICENSE> file
in this distribution.

=cut
