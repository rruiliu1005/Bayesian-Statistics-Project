data {
    int<lower=0> C;          // number of schools
    real m[C];               // estimated treatment effects
    real<lower=0> sigma[C];  // s.e.’s of effect estimates
}
parameters {
  real mu;
  real<lower=0> tau;
  real theta[C];
}

model {
  tau ~ cauchy(0,25);
  theta ~ normal(mu, tau);
  m ~ normal (theta, sigma); 
}