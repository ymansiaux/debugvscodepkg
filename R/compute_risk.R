#' @noRd
compute_risk <- function(cases, total) {
  results <- cases / total
  return(results)
}
