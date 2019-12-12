data {
    int<lower=0> C;          // number of schools
    real m[C];               // estimated treatment effects
    real<lower=0> sigma[C];  // s.e.’s of effect estimates
}
parameters {
  real theta[C];
  real mu; 
  real<lower=0> tau_squared;
}

transformed parameters {
  real<lower=0> tau = sqrt(tau_squared);
}

model {
  tau_squared ~ inv_gamma(5,0.1);
  m ~ normal(theta, sigma);
  theta ~ normal (mu, tau); 
}