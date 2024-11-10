#' Calculate Loan to Value Ratio
#'
#' Divides remaining principal by asset value.
#'
#' @param asset_value Value of asset.
#' @param remaining_principal Remaining principal.
#'
#' @return A quotient.
#' @export
#'
#' @examples
#' lvr(50, 100)
lvr <- function(remaining_principal, asset_value) {
  return(remaining_principal / asset_value)
}
