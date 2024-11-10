#' Calculate Remaining Principal after Payment
#'
#' Subtracts payment from principal before payment.
#'
#' @param remaining_principal Remaining principa before payment.
#' @param payment_towards_principal Payment.
#'
#' @return A difference.
#' @export
#'
#' @examples
#' remaining_principal(100, 10)
remaining_principal <- function(
    remaining_principal,
    payment_towards_principal
  ) {
  return(remaining_principal - payment_towards_principal)
}
