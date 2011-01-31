#ifndef __eff_ci_h_
#define __eff_ci_h_

void efficiency_ci(int k, int N, double conflevel, double* mode, double* low, double* high);

double search_upper(double low, int k, int N, double c);
double search_lower(double high, int k, int N, double c);

double interval(double low);

#endif
