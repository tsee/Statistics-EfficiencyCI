#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"


MODULE = Statistics::EfficiencyCI		PACKAGE = Statistics::EfficiencyCI		


void
efficiency_ci(k, N, conflevel = 0.683, OUTLIST mode, OUTLIST low, OUTLIST high)
    int k
    int N
    double conflevel
    double mode
    double low
    double high

