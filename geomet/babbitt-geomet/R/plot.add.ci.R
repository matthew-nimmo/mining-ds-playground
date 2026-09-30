plot.add.ci <- function(x, y, level=0.95, regressionColor="blue", biasColor="red", ...) {
  fit_r2 <- round(cor(x, y, use="pairwise.complete.obs")^2, 3)
  fit_sd <- round(sd(y-x), 3)
  fit_ci <- round(qnorm(level) * fit_sd, 3)

  xrange <- par("usr")[1:2]
  xdiff <- diff(xrange)
  yrange <- par("usr")[3:4]
  ydiff <- diff(yrange)

  text(xrange[1], yrange[1]+0.92*ydiff, bquote(R^2 == .(fit_r2)), cex=0.8, pos=4)
  text(xrange[1], yrange[1]+0.82*ydiff, bquote(SE == .(fit_sd)), cex=0.8, pos=4)

  abline(0, 1, col=regressionColor, lwd=1)
  abline(lm(y ~ x), col=biasColor, lwd=1)
  abline(fit_ci, 1, lty=2, col=regressionColor)
  abline(-fit_ci, 1, lty=2, col=regressionColor)
}
