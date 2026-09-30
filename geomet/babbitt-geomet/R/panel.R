panel.cor <- function(x, y, digits=2, prefix="", ...)
{
  usr <- par("usr"); on.exit(par(usr=usr))
  par(usr=c(0, 1, 0, 1))
  r <- cor(x, y, use="pairwise.complete.obs")
  txt <- format(c(r, 0.123456789), digits=digits)[1]
  txt <- paste0(prefix, txt)
  text(0.5, 0.5, txt, cex=1, col=ifelse(r>0.3, "blue", ifelse(r<(-0.3), "red", "black")))
}

panel.hist <- function(x, ...)
{
  usr <- par("usr"); on.exit(par(usr=usr))
  par(usr=c(usr[1:2], 0, 1.5))
  h <- hist(x, plot=FALSE, breaks="FD")
  breaks <- h$breaks
  nB <- length(breaks)
  y <- h$counts; y <- y/max(y)
  rect(breaks[-nB], 0, breaks[-1], y, col="darkgrey", ...)
}

panel.scatter <- function (x, y, col=par("col"), bg=NA, pch=par("pch"), cex=1, ...)
{
  dens <- densCols(x, y, colramp=colorRampPalette(c("black", "white")))
  dens <- col2rgb(dens)[1,] + 1L
  col <- viridis(256)[dens]
  points(x, y, pch=pch, col=col, bg=bg, cex=cex)
}
