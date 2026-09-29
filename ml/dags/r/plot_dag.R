plot_dag <- function(dag, labs=NULL, layout="auto") {
  g <- tidy_dagitty(dag, layout=layout, seed=1)
  
  if(is.null(labs)) {
    g <- ggplot(g, aes(x=x, y=y, xend=xend, yend=yend)) +
      geom_dag_edges_link(aes(start_cap=ggraph::circle(5,"mm"),
                              end_cap=ggraph::circle(5,"mm"))) +
      geom_dag_point(size=11) +
      geom_dag_text(size=4) +
      theme_dag()
  } else {
    g <- dplyr::mutate(g, lab = labs[name]) |>
      ggplot(aes(x=x, y=y, xend=xend, yend=yend)) +
      geom_dag_edges_link(aes(start_cap=ggraph::circle(5,"mm"),
                              end_cap=ggraph::circle(5,"mm"))) +
      geom_dag_point(size=11) +
      geom_dag_text(aes(label=lab), size=4) +
      theme_dag()
  }
  
  return(g)
}
