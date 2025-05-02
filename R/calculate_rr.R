#' Calculate Relative Risk (RR) from a Data Frame
#'
#' This function calculates the relative risk (RR) from a data frame containing counts of cases and total individuals in both exposed and unexposed groups.
#' @param df A data frame containing the following columns:
#' \itemize{
#' \item \code{cases_exposed}: Number of cases in the exposed group.
#' \item \code{total_exposed}: Total number of individuals in the exposed group.
#' \item \code{cases_unexposed}: Number of cases in the unexposed group.
#' \item \code{total_unexposed}: Total number of individuals in the unexposed group.
#' }
#' @param column_cases_exposed Name of the column containing the number of cases in the exposed group. Default is "cases_exposed".
#' @param column_total_exposed Name of the column containing the total number of individuals in the exposed group. Default is "total_exposed".
#' @param column_cases_unexposed Name of the column containing the number of cases in the unexposed group. Default is "cases_unexposed".
#' @param column_total_unexposed Name of the column containing the total number of individuals in the unexposed group. Default is "total_unexposed".
#' @return A data frame with an additional column for relative risk (RR).
#'
#' @importFrom dplyr %>% mutate
calculate_rr_in_df <- function(
    df,
    column_cases_exposed = "cases_exposed",
    column_total_exposed = "total_exposed",
    column_cases_unexposed = "cases_unexposed",
    column_total_unexposed = "total_unexposed") {
  risk1 <- compute_risk(df[, column_cases_exposed], df[, column_total_exposed])
  risk2 <- compute_risk(df[, column_cases_unexposed], df[, column_total_unexposed])
  df %>%
    mutate(
      rr = risk1 / risk2
    )
  return(df)
}
