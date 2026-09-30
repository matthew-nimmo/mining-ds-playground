bn_plot <- function(m, layout="dh") {
  flds <- names(m)
  flds1 <- flds[!grepl("[[:lower:]]", flds)]
  flds2 <- flds[grepl("_$", flds)]

  shp <- rep("Observed", length(flds))
  names(shp) <- flds
  shp[flds %in% flds1] <- "Unobserved"

  g <- as.igraph(m) %>%
    graph2dagitty() %>%
    tidy_dagitty(layout=layout, seed=2022) %>%
    dplyr::mutate(Observed = shp[name])

  g <- g %>%
    ggplot(aes(x=x, y=y, xend=xend, yend=yend)) +
    geom_dag_edges_diagonal(aes(start_cap=ggraph::circle(4,"mm"),
                                end_cap=ggraph::circle(4,"mm")), edge_colour="grey70", edge_width=0.2) +
    geom_dag_text(aes(colour=Observed), size=4) +
    scale_color_manual(values=c("Observed"="black", "Unobserved"="red")) +
    guides(color = FALSE) +
    theme_dag() +
    theme(legend.text = element_text(size=9),
          plot.margin = unit(c(0.1, 0.1, 0.1, 0.1), "cm"),
          plot.background = element_rect(color=1, size=1))

  return(g)
}
