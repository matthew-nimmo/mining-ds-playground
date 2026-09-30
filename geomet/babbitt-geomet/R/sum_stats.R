#' Calculate summary statistics.
#'
#' @param x data frame of numeric values.
#'
#' @return \code{x} data frame of summary statistics for each variable.
#'
#' @keywords sum_stats
#' @export
sum_stats <- function(x, method=c("full","simple")) {
  v <- c(Number = length(x),
         Missing = sum(is.na(x)),
         Completeness = round(sum(!is.na(x))/length(x)*100, 1),
         Unique = length(unique(x)))

  is_char <- is.character(x)
  if (is_char) {
    bd <- sum(grepl("[<-]", x))
    ud <- sum(grepl("[>+]", x))
    y <- readr::parse_number(x)
    if (all(is.na(y))) {
      y <- x
    }
  } else {
    y <- x
    bd <- NA
    ud <- NA
  }

  is_num <- is.numeric(y)
  if (is_num) {
    y <- na.omit(y)
    v <- c(v,
           `Below Detection` = bd,
           `Above Detection` = ud,
           Min = min(y),
           Max = max(y),
           Range = diff(range(y)),
           Mean = round(mean(y), 2),
           Median = round(median(y), 2),
           Var = round(var(y), 3),
           CV = signif(sd(y) / mean(y), 3))
  } else {
    v <- c(v,
           `Below Detection` = NA,
           `Above Detection` = NA,
           Min = NA,
           Max = NA,
           Range = NA,
           Mean = NA,
           Median = NA,
           Var = NA,
           CV = NA)
  }

  method <- match.arg(method, c("full","simple"))
  if (method == "simple") {
    v <- v[-c(3,4,5,12)]
  }

  return(v)
}
