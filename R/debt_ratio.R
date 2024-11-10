#' Calculate Debt Ratio
#'
#' Calculate debt ratio as defined by
#' [Finansinspektionen](https://www.fi.se/contentassets/690c9d8430bd4961b6073dedf4f9105f/fs1616-k2024.pdf).
#'
#' @param remaining_principal Remaining principal.
#' @param household_gross_income Household gross income.
#'
#' @return A quotient.
#' @export
#'
#' @md
#' @examples
#' debt_ratio(400, 100)
debt_ratio <- function(remaining_principal, household_gross_income) {
  return(remaining_principal / household_gross_income)
}
