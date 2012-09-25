#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include <float.h>
#include <math.h>
#include "eff_math_fun.h"

MODULE = Statistics::EfficiencyCI		PACKAGE = Statistics::EfficiencyCI		


void
efficiency_ci(k, N, conflevel = 0.683, OUTLIST mode, OUTLIST low, OUTLIST high)
    int k
    int N
    double conflevel
    double mode
    double low
    double high


void
log_gamma(x)
    double x
  PPCODE:
    dTARG;
    if (x <= 0
        && ( fabs(x - (int)x) <= DBL_EPSILON))
    {
      XSRETURN_UNDEF;
    }
    else {
      NV rv = log_gamma(x);
      SV *sv = sv_2mortal(newSVnv(rv));
      XPUSHs(sv);
      XSRETURN(1);
    }

