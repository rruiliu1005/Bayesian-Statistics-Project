data {
    int<lower=0> C;          // number of schools
    real m[C];               // estimated treatment effects
    real<lower=0> sigma[C];  // s.e.’s of effect estimates
}
parameters {
  real mu;
  real<lower=0> tau;
  vector[C] eta;
}
transformed parameters {
  vector[C] theta;
  theta <- mu + tau*eta;
}
// population m
// population sigma
// school-level errors
// school effects
  model {
    eta ~ normal(0, 1);
    m ~ normal(theta, sigma);
}