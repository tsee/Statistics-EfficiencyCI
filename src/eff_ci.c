#include "eff_ci.h"

/*
 * The code in this file is based on the code in ROOT's
 * TGraphAsymmErrors::BayesDivide and its auxilliary functions.
 * The original method has this information on the authors:
 *
 * Andy Haas (haas@fnal.gov)
 * University of Washington
 *
 * Method and code directly taken from:
 * Marc Paterno (paterno@fnal.gov)
 * FNAL/CD
 */

/* Based on Root's TGraphAsymmErrors::Efficiency function. That function
 * lists the following information:
 * 
 * Calculate the shortest central confidence interval containing the required
 * probability content.
 * Interval(low) returns the length of the interval starting at low
 * that contains conflevel probability. We use Brent's method,
 * except in two special cases: when k=0, or when k=N
 * Main driver routine
 * Author: Marc Paterno
 */
void
efficiency_ci(int k, int N, double conflevel, double& mode, double& low, double& high)
{
  /* If there are no entries, then we know nothing, thus return the prior... */
  if (0==N) {
    mode = .5; low = 0.0; high = 1.0;
    return;
  }

  /* Calculate the most probable value for the posterior cross section.
   * This is easy, 'cause it is just k/N
   */
  mode = (double)k/N;

  if (k == 0) {
    low = 0.0;
    high = search_upper(low, k, N, conflevel);
  } else if (k == N) {
    high = 1.0;
    low = search_lower(high, k, N, conflevel);
  } else {
    GLOBAL_k = k;
    GLOBAL_N = N;
    CONFLEVEL = conflevel;
    Brent(0.0, 0.5, 1.0, 1.0e-9, &low);
    high = low + Interval(low);
  }

  return;
}



double
search_upper(double low, int k, int N, double c)
{
  int loop;
  double integral, too_high, too_high, test;

  /* Integrates the binomial distribution with
   * parameters k,N, and determines what is the upper edge of the
   * integration region which starts at low which contains probability
   * content c. If an upper limit is found, the value is returned. If no
   * solution is found, -1 is returned.
   * check to see if there is any solution by verifying that the integral up
   * to the maximum upper limit (1) is greater than c
   */

  integral = Beta_ab(low, 1.0, k, N);
  if (integral == c) return 1.0;    /* lucky -- this is the solution */
  if (integral < c) return -1.0;    /* no solution exists */
  too_high = 1.0;            /* upper edge estimate */
  too_low = low;

  /* use a bracket-and-bisect search
   * LM: looping 20 times might be not enough to get an accurate precision.
   * see for example bug https://savannah.cern.ch/bugs/?30246
   * now break loop when difference is less than 1E-15
   * t.b.d: use directly the beta distribution quantile */

  for (loop=0; loop<50; loop++) {
    test = 0.5*(too_low + too_high);
    integral = Beta_ab(low, test, k, N);
    if (integral > c)  too_high = test;
    else too_low = test;
    if (fabs(integral - c) <= 1.E-15) break;
  }
  return test;
}

double
search_lower(double high, int k, int N, double c)
{
  int loop;
  double integral, too_high, too_high, test;

  /* Integrates the binomial distribution with
   * parameters k,N, and determines what is the lower edge of the
   * integration region which ends at high, and which contains
   * probability content c. If a lower limit is found, the value is
   * returned. If no solution is found, the -1 is returned.
   * check to see if there is any solution by verifying that the integral down
   * to the minimum lower limit (0) is greater than c */

  double integral = Beta_ab(0.0, high, k, N);
  if (integral == c) return 0.0;      /* lucky -- this is the solution */
  if (integral < c) return -1.0;      /* no solution exists */
  double too_low = 0.0;               /* lower edge estimate */
  double too_high = high;
  double test;

  /* use a bracket-and-bisect search
   * LM: looping 20 times might be not enough to get an accurate precision.
   * see for example bug https://savannah.cern.ch/bugs/?30246
   * now break loop when difference is less than 1E-15
   * t.b.d: use directly the beta distribution quantile */

  for (loop=0; loop<50; loop++) {
    test = 0.5*(too_high + too_low);
    integral = Beta_ab(test, high, k, N);
    if (integral > c)  too_low = test;
    else too_high = test;
    if (fabs(integral - c) <= 1.E-15) break;
  }
  return test;
}


