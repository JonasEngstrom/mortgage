#' Calculate Minimum Required Payment Towards Principal
#'
#' Calculate the minimum required payment towards the principal of a housing
#' loan, [as described by
#' Finansinspektionen](https://www.fi.se/contentassets/690c9d8430bd4961b6073dedf4f9105f/fs1616-k2024.pdf).
#'
#' @param initial_principal Initial principal amount.
#' @param loan_to_value_ratio Ratio of asset value to remaining principal.
#' @param debt_ratio Ratio of debt to household gross income.
#'
#' @return
#' @export
#'
#' @seealso [lvr()]
#' @seealso [debt_ratio()]
#'
#' @md
#' @examples
#' minimum_monthly_payment(500, 0.5, 3)
minimum_monthly_payment <- function(
    initial_principal,
    loan_to_value_ratio,
    debt_ratio
  ) {
  if (loan_to_value_ratio > .7) {
    return(initial_principal * .02 / 12)
  } else if (loan_to_value_ratio > .5 | debt_ratio > 4.5) {
    return(initial_principal * .01 / 12)
  } else {
    return(0)
  }
}
