#ifndef __eff_ci_h_
#define __eff_ci_h_

void efficiency_ci(int k, int N, double conflevel, double* mode, double* low, double* high);

double brent(double ax, double bx, double cx, double tol, double *xmin, int k, int N, double conflevel);

double search_upper(double low, int k, int N, double c);
double search_lower(double high, int k, int N, double c);

double interval(double low, int k, int N, double conflevel);

#endif
