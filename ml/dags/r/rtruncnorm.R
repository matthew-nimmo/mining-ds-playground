rtruncnorm <- function(n, mean=0, sd=1, a=-Inf, b=Inf) {
  p_a <- pnorm(a, mean=mean, sd=sd)
  p_b <- pnorm(b, mean=mean, sd=sd)
  u <- runif(n, min=p_a, max=p_b)
  return(qnorm(u, mean=mean, sd=sd))
}
