#' Calculate Daily Compounding Interest Rate
#'
#' Calculate daily compounding interest rate from a yearly rate and calendar
#' year. Accounts for leap years. Uses the following formula: \deqn{\text{daily
#' interest rate} = (1 + \text{yearly interest rate})^{(\frac{1}{365 + 1 \text{
#' if calendar year is a leap year}})} - 1}
#'
#' @param yearly_interest_rate The yearly interest rate.
#' @param calendar_year The calendar year.
#'
#' @return The daily interest rate.
#' @export
#'
#' @examples
#' daily_rate <- daily_interest_rate(0.05, 2001)
daily_interest_rate <- function(yearly_interest_rate, calendar_year) {
  return((1 + yearly_interest_rate) ^ (1 / (365 + lubridate::leap_year(calendar_year))) - 1)
}
