#' Calculate the Absolute Value of Tax Based on a Standard Rate of Capital
#' Income
#'
#' Calculate the absolute tax for a transaction based on a tandard rate of
#' capital income, using [the method described by
#' Avanza](https://www.avanza.se/lar-dig-mer/avanza-akademin/skatt-deklaration/hur-beskattas-en-kapitalforsakring.html).
#'
#' @param date Date of transaction.
#' @param standard_rate_of_capital_income The standard rate of capital income.
#' @param transaction_total The transaction total.
#'
#' @return A numeric.
#' @export
#'
#' @md
#' @examples
#' standard_sum(as.Date('2024-01-01'), 0.0362, 100000)
standard_sum <- function(date, standard_rate_of_capital_income, transaction_total) {
  second_half_of_year <- lubridate::month(date) >=7
  tax_rate <- .3

  return(transaction_total / (1 + second_half_of_year) * standard_rate_of_capital_income * tax_rate)
}
