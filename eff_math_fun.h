#ifndef __eff_math_fun_h_
#define __eff_math_fun_h_

double log_gamma(double x);
double beta_ab(double a, double b, int k, int N);
double ibetai(double a, double b, double x);
double beta_cf(double x, double a, double b);

double polynomial_1eval(double x, double* a, unsigned int N);
double polynomial_eval(double x, double* a, unsigned int N);
#endif
