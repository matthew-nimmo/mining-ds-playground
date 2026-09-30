build_umap <- function(x, n_neighbors=15) {
  flds <- names(x)
  flds <- flds[sapply(x, is.numeric)]

  if (any(is.na(x))) {
    set.seed(2022)
    y <- mice::mice(x[,flds], m=1, maxit=15, seed=1, print=FALSE, method="cart")
    y <- mice::complete(y)
  } else {
    y <- x
  }

  set.seed(21)
  if (nrow(y) > 5000) {
    i <- clhs(y, 5000, simple=TRUE)
    y <- y[i, ]
  }

  y <- scale(y)
  um <- umap::umap(y, n_components=2, n_neighbors=n_neighbors, min_dist=1e-10)

  return(um)
}
